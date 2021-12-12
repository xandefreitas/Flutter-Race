import 'package:flutter/material.dart';
import 'package:primeiroapp/shared/models/order_model.dart';
import 'package:primeiroapp/shared/theme/app_theme.dart';

class AppListTile extends StatelessWidget {
  final OrderModel order;
  const AppListTile({
    Key? key,
    required this.order,
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
              order.created.split("-").sublist(1).join('-'),
              style: AppTheme.textStyles.label,
            ),
            radius: 30,
          ),
          title: Text(order.name, style: AppTheme.textStyles.listTileTitle),
          subtitle: Text("R\$ ${order.price.toStringAsFixed(2)}", style: AppTheme.textStyles.listTileSubtitle),
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
