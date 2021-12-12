import 'package:primeiroapp/modules/feed/repositories/feed_repository.dart';
import 'package:primeiroapp/shared/models/order_model.dart';
import 'package:primeiroapp/shared/services/app_database.dart';

class FeedRepositoryImpl implements FeedRepository {
  final AppDatabase database;

  FeedRepositoryImpl({required this.database});
  @override
  Future<List<OrderModel>> getAll() async {
    final response = await database.getAll(table: 'orders');
    return response.map((e) => OrderModel.fromMap(e)).toList();
  }
}
