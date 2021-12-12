import 'package:flutter/material.dart';
import 'package:primeiroapp/shared/theme/app_theme.dart';
import 'package:primeiroapp/shared/theme/app_text.dart';
import 'package:primeiroapp/shared/widgets/horizontalChart/horizontal_chart.dart';

class ChartCard extends StatelessWidget {
  final double value;
  final double percentage;
  const ChartCard({Key? key, required this.value, required this.percentage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 216,
      decoration: BoxDecoration(
        color: AppTheme.colors.textEnabled,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Gasto mensal').label,
            SizedBox(height: 18),
            Text.rich(
              TextSpan(
                text: 'R\$ ',
                style: AppTheme.textStyles.label,
                children: [
                  TextSpan(
                    text: value.toStringAsFixed(2).replaceAll(".", ","),
                    style: AppTheme.textStyles.title.copyWith(fontSize: 36),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            HorizontalChart(percentage: percentage),
          ],
        ),
      ),
    );
  }
}
