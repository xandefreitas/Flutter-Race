import 'package:flutter/material.dart';
import 'package:primeiroapp/modules/login/login_controller.dart';
import 'package:primeiroapp/modules/login/pages/createAccount/create_account_page.dart';
import 'package:primeiroapp/modules/login/repositories/login_repository.dart';
import 'package:primeiroapp/modules/login/repositories/login_repository_impl.dart';
import 'package:primeiroapp/shared/services/app_database.dart';

import 'package:primeiroapp/shared/theme/app_theme.dart';
import 'package:primeiroapp/shared/widgets/button/button.dart';
import 'package:primeiroapp/shared/widgets/inputText/input_text.dart';
import 'package:validators/validators.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final LoginController controller;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    controller = LoginController(repository: LoginRepositoryImpl(database: AppDatabase.instance));
    controller.addListener(() {
      controller.appState.when(
        success: (value) => Navigator.pushNamed(context, '/home', arguments: value),
        loading: () => print('Loading...'),
        error: (message, _) => scaffoldKey.currentState!.showBottomSheet(
          (context) => Container(
            child: Text(message),
          ),
        ),
        orElse: () {},
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: AppTheme.colors.background,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36),
            child: Form(
              key: controller.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    width: 200,
                  ),
                  InputText(
                    label: 'E-Mail',
                    hint: 'Digite seu email',
                    onChanged: (email) => controller.onChanged(email: email),
                    validator: (value) => isEmail(value) ? null : 'Digite um e-mail válido',
                  ),
                  SizedBox(height: 18),
                  InputText(
                    label: 'Senha',
                    hint: 'Digite sua senha',
                    obscure: true,
                    onChanged: (password) => controller.onChanged(password: password),
                    validator: (value) => value.length >= 6 ? null : 'Digite uma senha mais forte',
                  ),
                  SizedBox(height: 14),
                  AnimatedBuilder(
                    animation: controller,
                    builder: (_, __) => controller.appState.when(
                      loading: () => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(),
                      ),
                      orElse: () => Column(
                        children: [
                          Button(
                            label: 'Entrar',
                            type: ButtonType.fill,
                            onPressed: () => controller.login(),
                          ),
                          SizedBox(height: 24),
                          Button(
                            label: 'Criar conta',
                            type: ButtonType.outline,
                            onPressed: () => Navigator.pushNamed(context, '/login/create_account'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
