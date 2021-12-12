import 'package:flutter/material.dart';
import 'package:primeiroapp/modules/feed/feed_controller.dart';
import 'package:primeiroapp/modules/feed/repositories/feed_repository_impl.dart';
import 'package:primeiroapp/shared/models/order_model.dart';
import 'package:primeiroapp/shared/services/app_database.dart';
import 'package:primeiroapp/shared/widgets/chartCard/chart_card.dart';
import 'package:primeiroapp/shared/widgets/listTile/app_list_tile.dart';
import 'package:primeiroapp/shared/widgets/productCard/product_card.dart';
import 'package:primeiroapp/shared/theme/app_text.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({
    Key? key,
  }) : super(key: key);

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  late final FeedController controller;

  @override
  void initState() {
    controller = FeedController(repository: FeedRepositoryImpl(database: AppDatabase.instance));
    controller.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      top: true,
      child: SingleChildScrollView(
        child: AnimatedBuilder(
          animation: controller,
          builder: (_, __) => controller.appState.when(
            success: (value) {
              final orders = value as List<OrderModel>;
              final products = controller.products;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ChartCard(
                          value: controller.totalSum,
                          percentage: controller.percentageCalc(products),
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
                      itemCount: products.length,
                      itemBuilder: (context, i) => ProductCard(
                        product: products[i],
                      ),
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
                        for (var order in orders) AppListTile(order: order),
                      ],
                    ),
                  ),
                  SizedBox(height: 100),
                ],
              );
            },
            orElse: () => Container(),
          ),
        ),
      ),
    );
  }
}
