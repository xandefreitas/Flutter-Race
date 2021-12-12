import 'package:primeiroapp/shared/models/user_model.dart';
import 'package:primeiroapp/shared/services/supabase_database.dart';

abstract class AppDatabase {
  static final AppDatabase instance = SupabaseDatabase();
  void init();
  Future<UserModel> login({required String email, required String password});
  Future<UserModel> createAccount({required String email, required String password, required String name});
  Future<UserModel> createUser({required UserModel user});
  Future<UserModel> getUser({required String id});
  Future<bool> createProduct({required String table, required Map<String, dynamic> data});
  Future<List<Map<String, dynamic>>> getAll({required String table});
}
