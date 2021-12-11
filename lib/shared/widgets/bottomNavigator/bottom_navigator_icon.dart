import 'package:flutter/material.dart';
import 'package:primeiroapp/shared/theme/app_theme.dart';

class BottomNavigatorIcon extends StatelessWidget {
  final Function() onTap;
  final bool enabled;
  final IconData icon;

  const BottomNavigatorIcon({
    Key? key,
    required this.onTap,
    required this.enabled,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: enabled ? AppTheme.colors.primary : AppTheme.colors.background,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(
          icon,
          color: enabled ? AppTheme.colors.textEnabled : AppTheme.colors.iconInactive,
        ),
      ),
    );
  }
}
