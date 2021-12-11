import 'package:flutter/material.dart';
import 'package:primeiroapp/modules/login/pages/createAccount/create_account_controller.dart';
import 'package:primeiroapp/modules/login/repositories/login_repository_impl.dart';
import 'package:primeiroapp/shared/services/app_database.dart';
import 'package:primeiroapp/shared/theme/app_theme.dart';
import 'package:primeiroapp/shared/widgets/button/button.dart';
import 'package:primeiroapp/shared/widgets/inputText/input_text.dart';
import 'package:validators/validators.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  late final CreateAccountController controller;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    controller = CreateAccountController(repository: LoginRepositoryImpl(database: AppDatabase.instance));
    controller.addListener(() {
      controller.appState.when(
        success: (value) => Navigator.pop(context),
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
      appBar: AppBar(
        backgroundColor: AppTheme.colors.background,
        elevation: 0,
        leading: BackButton(
          color: AppTheme.colors.backButton,
        ),
      ),
      backgroundColor: AppTheme.colors.background,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36),
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Criando uma conta',
                    style: AppTheme.textStyles.title,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Mantenha seus gastos em dia',
                    style: AppTheme.textStyles.subtitle,
                  ),
                  SizedBox(height: 38),
                  InputText(
                    label: 'Nome',
                    hint: 'Digite seu nome completo',
                    onChanged: (name) => controller.onChanged(name: name),
                    validator: (value) => value.isNotEmpty ? null : 'Digite seu nome completo',
                  ),
                  SizedBox(height: 18),
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
                        child: Center(child: CircularProgressIndicator()),
                      ),
                      orElse: () => Button(
                        label: 'Criar conta',
                        type: ButtonType.fill,
                        onPressed: () {
                          controller.create();
                        },
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
