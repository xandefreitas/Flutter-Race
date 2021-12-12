import 'package:flutter/material.dart';
import 'package:primeiroapp/shared/models/order_model.dart';
import 'package:primeiroapp/shared/models/product_model.dart';
import 'package:primeiroapp/shared/utils/app_state.dart';

import 'repositories/feed_repository.dart';

class FeedController extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final FeedRepository repository;
  AppState appState = AppState.empty();

  FeedController({required this.repository});

  bool validate() {
    final form = formKey.currentState!;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void getData() async {
    try {
      update(AppState.loading());
      final response = await repository.getAll();
      update(AppState.success<List<OrderModel>>(response));
    } catch (e) {
      update(AppState.error(e.toString()));
    }
  }

  void update(AppState state) {
    this.appState = state;
    notifyListeners();
  }

  double percentageCalc(List<ProductModel> products) {
    double up = 0.0;
    double down = 0.0;
    for (var item in products) {
      if (item.currentPrice < item.lastPrice) {
        up += 1;
      } else {
        down += 1;
      }
    }
    final result = down / up;
    if (result > 1) {
      return 1;
    }
    return result;
  }

  List<ProductModel> get products {
    final products = <ProductModel>[];
    for (var item in orders) {
      final product = ProductModel(name: item.name, lastPrice: 0, currentPrice: item.price);
      final index = products.indexWhere((element) => element.name == product.name);
      if (index != -1) {
        final currentProduct = products[index];
        products[index] = currentProduct.copyWith(lastPrice: item.price);
      } else {
        products.add(product);
      }
    }
    return products;
  }

  List<OrderModel> get orders => appState.when(success: (value) => value, orElse: () => []);

  double get totalSum {
    double sum = 0.0;
    for (var item in orders) {
      sum += item.price;
    }
    return sum;
  }
}
