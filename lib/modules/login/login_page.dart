import 'package:flutter/material.dart';

import 'package:primeiroapp/shared/theme/app_theme.dart';
import 'package:primeiroapp/shared/widgets/button/button.dart';
import 'package:primeiroapp/shared/widgets/inputText/input_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 200,
            ),
            InputText(label: 'E-Mail', hint: 'Digite seu email'),
            SizedBox(height: 18),
            InputText(label: 'Senha', hint: 'Digite sua senha'),
            SizedBox(height: 14),
            Button(
              label: 'Entrar',
              type: ButtonType.fill,
              onPressed: () {},
            ),
            SizedBox(height: 24),
            Button(
              label: 'Criar conta',
              type: ButtonType.outline,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
