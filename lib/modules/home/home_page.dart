import 'package:flutter/material.dart';
import 'package:primeiroapp/shared/models/user_model.dart';
import 'package:primeiroapp/shared/theme/app_theme.dart';
import 'package:primeiroapp/shared/widgets/bottomNavigator/app_bottom_navigator.dart';
import 'package:primeiroapp/shared/widgets/listTile/app_list_tile.dart';
import 'package:primeiroapp/shared/widgets/productCard/product_card.dart';

class HomePage extends StatefulWidget {
  final UserModel user;
  const HomePage({Key? key, required this.user}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppTheme.colors.background,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 126,
                width: size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, i) => ProductCard(),
                ),
              ),
              AppListTile(),
              AppListTile(),
              AppListTile(),
            ],
          ),
          Positioned(
            bottom: 14,
            right: 26,
            left: 26,
            child: AppBottomNavigator(
              currentIndex: currentIndex,
              onChanged: changeIndex,
            ),
          )
        ],
      ),
    );
  }
}
