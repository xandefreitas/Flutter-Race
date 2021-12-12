import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:primeiroapp/shared/theme/app_theme.dart';

class ProductCard extends StatelessWidget {
  final bool like;
  const ProductCard({Key? key, required this.like}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
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
                child: like
                    ? Icon(FontAwesomeIcons.thumbsUp)
                    : Icon(
                        FontAwesomeIcons.thumbsDown,
                        color: AppTheme.colors.badColor,
                      ),
                radius: 30,
              ),
              title: Text('Produto', style: AppTheme.textStyles.listTileTitle),
              subtitle: Text('Preço', style: AppTheme.textStyles.listTileSubtitle),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: Text.rich(
                TextSpan(text: "Agora\n", style: AppTheme.textStyles.listTileSubtitle, children: [
                  TextSpan(text: "R\$ 67,50", style: AppTheme.textStyles.title),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
