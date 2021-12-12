import 'package:flutter/material.dart';
import 'package:primeiroapp/modules/create/create_bottom_sheet.dart';
import 'package:primeiroapp/modules/feed/feed_page.dart';
import 'package:primeiroapp/shared/models/user_model.dart';
import 'package:primeiroapp/shared/theme/app_theme.dart';
import 'package:primeiroapp/shared/widgets/bottomNavigator/app_bottom_navigator.dart';

class HomePage extends StatefulWidget {
  // final UserModel user;
  final List<Widget> pages;
  const HomePage({
    Key? key,
    required this.pages,
    // required this.user,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  void changeIndex(int index) {
    if (index == 3) {
      showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
        ),
        context: context,
        builder: (context) => CreateBottomSheet(),
      );
    } else {
      currentIndex = index;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppTheme.colors.background,
      body: SizedBox(
        height: size.height,
        child: Stack(
          children: [
            widget.pages[currentIndex],
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
      ),
    );
  }
}
