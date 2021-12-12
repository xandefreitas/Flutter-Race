import 'package:flutter/material.dart';
import 'package:primeiroapp/shared/theme/app_theme.dart';

class AppListTile extends StatelessWidget {
  const AppListTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.colors.textEnabled,
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: AppTheme.colors.background,
            child: Text(
              '12/12',
              style: AppTheme.textStyles.label,
            ),
            radius: 30,
          ),
          title: Text('Produto', style: AppTheme.textStyles.listTileTitle),
          subtitle: Text('Preço', style: AppTheme.textStyles.listTileSubtitle),
          trailing: PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text('Editar'),
                value: 0,
              ),
              PopupMenuItem(
                child: Text('Excluir'),
                value: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
