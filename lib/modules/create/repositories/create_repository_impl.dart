import 'package:primeiroapp/shared/services/app_database.dart';

import 'create_repository.dart';

class CreateRepositoryImpl implements CreateRepository {
  final AppDatabase database;

  CreateRepositoryImpl({required this.database});
  @override
  Future<bool> create({required String name, required String price, required String date}) async {
    final priceParse = double.parse(price.replaceAll(RegExp(r'[R$,]'), ''));
    final response = await database.createProduct(table: 'orders', data: {
      "name": name,
      "price": priceParse,
      "created": date,
    });
    return response;
  }
}
