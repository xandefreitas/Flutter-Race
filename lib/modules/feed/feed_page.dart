import 'package:flutter/material.dart';
import 'package:primeiroapp/shared/widgets/chartCard/chart_card.dart';
import 'package:primeiroapp/shared/widgets/listTile/app_list_tile.dart';
import 'package:primeiroapp/shared/widgets/productCard/product_card.dart';
import 'package:primeiroapp/shared/theme/app_text.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      top: true,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ChartCard(
                    value: 365.00,
                    percentage: 0.1,
                  ),
                  SizedBox(height: 27),
                  Text('Preço dos produtos').label,
                  SizedBox(height: 14),
                ],
              ),
            ),
            SizedBox(
              height: 126,
              width: size.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, i) => ProductCard(like: i % 2 == 0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 27),
                  Text('Suas últimas compras').label,
                  SizedBox(height: 14),
                  AppListTile(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
