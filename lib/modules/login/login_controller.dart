import 'package:flutter/material.dart';
import 'package:primeiroapp/shared/services/app_database.dart';
import 'package:primeiroapp/shared/utils/app_state.dart';

class LoginController extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  AppState appState = AppState.empty();
  String _email = '';
  String _password = '';

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
        await AppDatabase.instance.login(email: _email, password: _password);
        update(AppState.success<String>('data'));
      } catch (e) {
        update(AppState.error('message', e: e as Exception));
      }
    }
  }

  void update(AppState state) {
    this.appState = state;
    notifyListeners();
  }
}
