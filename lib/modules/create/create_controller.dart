import 'package:flutter/material.dart';
import 'package:primeiroapp/shared/utils/app_state.dart';

import 'repositories/create_repository.dart';

class CreateController extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final CreateRepository repository;
  AppState appState = AppState.empty();
  String _name = '';
  String _price = '';
  String _date = '';

  CreateController({required this.repository});

  void onChanged({String? name, String? price, String? date}) {
    _name = name ?? _name;
    _price = price ?? _price;
    _date = date ?? _date;
  }

  bool validate() {
    final form = formKey.currentState!;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void create() async {
    if (validate()) {
      try {
        update(AppState.loading());
        final response = await repository.create(name: _name, price: _price, date: _date);
        if (response == true) {
          update(AppState.success<bool>(response));
        } else {
          throw Exception('Não foi possível cadastrar');
        }
      } catch (e) {
        update(AppState.error(e.toString()));
      }
    }
  }

  void update(AppState state) {
    this.appState = state;
    notifyListeners();
  }
}
