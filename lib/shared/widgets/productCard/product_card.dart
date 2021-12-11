import 'package:flutter/material.dart';
import 'package:primeiroapp/shared/theme/app_theme.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 230,
        decoration: BoxDecoration(
          color: AppTheme.colors.textEnabled,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundColor: AppTheme.colors.background,
                child: Icon(Icons.linked_camera),
                radius: 30,
              ),
              title: Text('Produto'),
              subtitle: Text('Preço'),
            ),
            Text.rich(TextSpan(text: "Agora\n", children: [TextSpan(text: 'R\$ 67.50')])),
          ],
        ),
      ),
    );
  }
}
