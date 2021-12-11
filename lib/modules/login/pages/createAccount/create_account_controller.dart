import 'package:flutter/material.dart';
import 'package:primeiroapp/modules/login/repositories/login_repository.dart';
import 'package:primeiroapp/shared/models/user_model.dart';
import 'package:primeiroapp/shared/services/app_database.dart';
import 'package:primeiroapp/shared/utils/app_state.dart';

class CreateAccountController extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final LoginRepository repository;
  AppState appState = AppState.empty();
  String _email = '';
  String _password = '';
  String _name = '';

  CreateAccountController({required this.repository});

  void onChanged({String? email, String? password, String? name}) {
    _email = email ?? _email;
    _password = password ?? _password;
    _name = name ?? _name;
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
        final response = await repository.createAccount(email: _email, password: _password, name: _name);
        print(response);
        update(AppState.success<UserModel>(response));
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
