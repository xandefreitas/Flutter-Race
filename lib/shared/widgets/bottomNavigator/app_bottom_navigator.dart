import 'package:flutter/material.dart';
import 'package:primeiroapp/shared/theme/app_theme.dart';

import 'bottom_navigator_icon.dart';

class AppBottomNavigator extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onChanged;
  const AppBottomNavigator({
    Key? key,
    required this.currentIndex,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(26, 0, 26, 14),
      child: Container(
        height: 76,
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BottomNavigatorIcon(
              onTap: () => onChanged(0),
              enabled: currentIndex == 0,
              icon: Icons.home,
            ),
            BottomNavigatorIcon(
              onTap: () => onChanged(3),
              enabled: false,
              icon: Icons.add,
            ),
            BottomNavigatorIcon(
              onTap: () => onChanged(1),
              enabled: currentIndex == 1,
              icon: Icons.settings,
            ),
          ],
        ),
      ),
    );
  }
}
