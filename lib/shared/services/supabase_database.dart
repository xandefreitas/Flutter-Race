import 'package:primeiroapp/shared/models/user_model.dart';
import 'package:primeiroapp/shared/services/app_database.dart';
import 'package:supabase/supabase.dart';

class SupabaseDatabase implements AppDatabase {
  late final SupabaseClient client;

  SupabaseDatabase() {
    init();
  }
  @override
  void init() {
    client = SupabaseClient(
      const String.fromEnvironment('SUPABASEURL'),
      const String.fromEnvironment('SUPABASEKEY'),
    );
  }

  @override
  Future<UserModel> createAccount({required String email, required String password, required String name}) async {
    final response = await client.auth.signUp(email, password);
    if (response.error == null) {
      final user = UserModel(email: email, id: response.user!.id, name: name);
      await createUser(user: user);
      return user;
    } else {
      throw Exception(response.error?.message ?? 'Não foi possível criar conta');
    }
  }

  @override
  Future<UserModel> login({required String email, required String password}) async {
    final response = await client.auth.signIn(email: email, password: password);
    if (response.error == null) {
      final user = await getUser(id: response.user!.id);
      return user;
    } else {
      throw Exception(response.error?.message ?? 'Não foi possível realizar login');
    }
  }

  @override
  Future<UserModel> createUser({required UserModel user}) async {
    final response = await client.from('users').insert(user.toMap()).execute();
    if (response.error == null) {
      return user;
    } else {
      throw Exception('Não foi possível cadastrar usuário');
    }
  }

  @override
  Future<UserModel> getUser({required String id}) async {
    final response = await client.from('users').select().filter('id', 'eq', id).execute();
    if (response.error == null) {
      final user = UserModel.fromMap(response.data[0]);
      return user;
    } else {
      throw Exception('Não foi possível buscar usuário');
    }
  }

  @override
  Future<bool> createProduct({required String table, required Map<String, dynamic> data}) async {
    final response = await client.from(table).insert(data).execute();
    if (response.error != null) {
      throw Exception(response.error!.message);
    }
    return true;
  }

  @override
  Future<List<Map<String, dynamic>>> getAll({required String table}) async {
    final response = await client.from(table).select('*').order('created').execute();
    if (response.error != null) {
      throw Exception(response.error!.message);
    }
    return (response.data as List<dynamic>).map((e) => e as Map<String, dynamic>).toList();
  }
}
