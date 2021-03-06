import 'package:flutter/material.dart';
import 'package:primeiroapp/shared/theme/app_theme.dart';

class HorizontalChart extends StatelessWidget {
  final double percentage;
  const HorizontalChart({Key? key, required this.percentage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.maxFinite,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              colors: [
                AppTheme.colors.badColor,
                AppTheme.colors.primary,
              ],
              stops: [percentage, 0.0],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (percentage > 0 && percentage <= 1)
                  Text(
                    "${(percentage * 100).ceil()}%",
                    style: AppTheme.textStyles.chart,
                  ),
                if ((1 - percentage) > 0)
                  Text(
                    "${((1 - percentage) * 100).ceil()}%",
                    style: AppTheme.textStyles.chart,
                  )
              ],
            ),
          ),
        ),
        SizedBox(height: 12),
        Text(
          'Relação de compras caras e boas compras',
          style: AppTheme.textStyles.hint,
        ),
        SizedBox(height: 14),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 10,
                  backgroundColor: AppTheme.colors.badColor,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Ruim",
                  style: AppTheme.textStyles.hint,
                ),
              ],
            ),
            Row(
              children: [
                CircleAvatar(
                  radius: 10,
                  backgroundColor: AppTheme.colors.primary,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Bom",
                  style: AppTheme.textStyles.hint,
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
