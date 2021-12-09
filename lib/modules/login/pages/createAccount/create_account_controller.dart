import 'package:flutter/material.dart';
import 'package:primeiroapp/shared/utils/app_state.dart';

class CreateAccountController extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  AppState appState = AppState.empty();
  String _email = '';
  String _password = '';
  String _name = '';

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
        //Chamada da API
        await Future.delayed(Duration(seconds: 4));
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
