import 'package:primeiroapp/shared/models/order_model.dart';

abstract class FeedRepository {
  Future<List<OrderModel>> getAll();
}
