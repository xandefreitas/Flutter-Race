import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:primeiroapp/modules/create/repositories/create_repository_impl.dart';
import 'package:primeiroapp/shared/services/app_database.dart';
import 'package:primeiroapp/shared/widgets/button/button.dart';
import 'package:primeiroapp/shared/widgets/inputText/input_text.dart';

import 'create_controller.dart';

class CreateBottomSheet extends StatefulWidget {
  const CreateBottomSheet({Key? key}) : super(key: key);

  @override
  State<CreateBottomSheet> createState() => _CreateBottomSheetState();
}

class _CreateBottomSheetState extends State<CreateBottomSheet> {
  final DateTime dateTimeToday = DateTime.now();
  late final CreateController controller;

  @override
  void initState() {
    controller = CreateController(repository: CreateRepositoryImpl(database: AppDatabase.instance));
    controller.addListener(() {
      controller.appState.when(
        success: (_) => Navigator.pop(context),
        orElse: () {},
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(32),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 42, vertical: 8),
            child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 32,
                  ),
                  InputText(
                    label: "Produto",
                    hint: "Digite um nome",
                    onChanged: (value) => controller.onChanged(name: value),
                    validator: (value) => value.isNotEmpty ? null : 'Favor digitar um nome',
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  InputText(
                    label: "Preço",
                    hint: "Digite o valor",
                    onChanged: (value) => controller.onChanged(price: value),
                    validator: (value) => value.isNotEmpty ? null : 'Favor digitar um valor',
                    textInputType: TextInputType.number,
                    inputFormatters: [MoneyInputFormatter(leadingSymbol: 'R\$')],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  InputText(
                    label: "Data da compra",
                    hint: "Digite dd/mm/aaaa",
                    onChanged: (value) => controller.onChanged(date: value),
                    textInputType: TextInputType.datetime,
                    initialValue: '${dateTimeToday.day}/${dateTimeToday.month}/${dateTimeToday.year}',
                    inputFormatters: [MaskedInputFormatter('00/00/0000')],
                    validator: (value) {
                      if (value.isNotEmpty) {
                        controller.onChanged(date: value);
                        return null;
                      } else {
                        return 'Favor digitar uma data';
                      }
                    },
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  AnimatedBuilder(
                    animation: controller,
                    builder: (_, __) => controller.appState.when(
                      loading: () => Center(
                        child: CircularProgressIndicator(),
                      ),
                      error: (message, _) => Text(message),
                      orElse: () => Button(
                        label: "Adicionar",
                        onPressed: () => controller.create(),
                        type: ButtonType.fill,
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
