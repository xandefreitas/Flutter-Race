import 'package:flutter/material.dart';
import 'package:primeiroapp/shared/widgets/button/button.dart';
import 'package:primeiroapp/shared/widgets/inputText/input_text.dart';

class CreateBottomSheet extends StatelessWidget {
  const CreateBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 42, vertical: 8),
        child: Column(
          children: [
            SizedBox(
              height: 32,
            ),
            InputText(label: "Produto", hint: "Digite um nome"),
            SizedBox(
              height: 8,
            ),
            InputText(label: "Preço", hint: "Digite o valor"),
            SizedBox(
              height: 8,
            ),
            InputText(label: "Data da compra", hint: "Digite dd/mm/aaaa"),
            SizedBox(
              height: 8,
            ),
            SizedBox(
              height: 20,
            ),
            Button(
              label: "Adicionar",
              onPressed: () {},
              type: ButtonType.fill,
            )
          ],
        ),
      ),
    );
  }
}
