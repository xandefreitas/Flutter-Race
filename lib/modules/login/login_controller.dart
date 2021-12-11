import 'package:flutter/material.dart';
import 'package:primeiroapp/modules/login/repositories/login_repository.dart';
import 'package:primeiroapp/shared/models/user_model.dart';
import 'package:primeiroapp/shared/services/app_database.dart';
import 'package:primeiroapp/shared/utils/app_state.dart';

class LoginController extends ChangeNotifier {
  final LoginRepository repository;
  final formKey = GlobalKey<FormState>();
  AppState appState = AppState.empty();
  String _email = '';
  String _password = '';

  LoginController({required this.repository});

  void onChanged({String? email, String? password}) {
    _email = email ?? _email;
    _password = password ?? _password;
  }

  bool validate() {
    final form = formKey.currentState!;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  Future<void> login() async {
    if (validate()) {
      try {
        update(AppState.loading());
        final response = await repository.login(email: _email, password: _password);
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
