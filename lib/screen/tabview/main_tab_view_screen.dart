import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import '../home/home_tab_screen.dart';
import 'main_tab_view_controller.dart';

class MainTabViewScreen extends StatelessWidget {
  MainTabViewScreen({super.key});

  final maincontroller = Get.put(MainTabViewController());

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      tabs: [
        PersistentTabConfig(
          screen:HomeTabScreen(),
          item: ItemConfig(
            icon: Icon(Icons.home),
            title: "Home",
          ),
        ),
        PersistentTabConfig(
          screen: Container(
            color: Colors.blue,
          ),
          item: ItemConfig(
            icon: Icon(Icons.shopping_cart),
            title: "Shopping",
          ),
        ),
        PersistentTabConfig(
          screen: Container(
            color: Colors.green,
          ),
          item: ItemConfig(

            activeForegroundColor: Colors.red,
            icon: Icon(Icons.favorite),
            title: "Favourite",
          ),
        ),
        PersistentTabConfig(
          screen: Container(
            color: Colors.green,
          ),
          item: ItemConfig(

            icon: Icon(Icons.person),
            title: "Account",
          ),
        ),
      ],
      navBarBuilder: (navBarConfig) => Style2BottomNavBar(
          navBarConfig: navBarConfig,
          navBarDecoration: NavBarDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
              ),
            ],
          ),
          itemAnimationProperties: ItemAnimation(
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInCubic,
          )),
    );
  }
}
