import 'package:flutter/material.dart';
import 'package:primeiroapp/modules/home/home_page.dart';
import 'package:primeiroapp/modules/splash/splash_page.dart';
import 'package:primeiroapp/shared/models/user_model.dart';

import 'modules/login/login_page.dart';
import 'modules/login/pages/createAccount/create_account_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Race #1',
      theme: ThemeData(primarySwatch: Colors.green),
      initialRoute: '/login',
      routes: {
        '/splash': (context) => const SplashPage(),
        '/login': (context) => const LoginPage(),
        '/login/create_account': (context) => const CreateAccountPage(),
        '/home': (context) => HomePage(user: ModalRoute.of(context)!.settings.arguments as UserModel),
      },
    );
  }
}
