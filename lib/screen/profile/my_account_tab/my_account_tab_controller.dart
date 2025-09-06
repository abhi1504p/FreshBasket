import 'package:flutter/material.dart';
import 'package:freshbasket/screen/favorite/favourite_tab_screen.dart';
import 'package:freshbasket/screen/profile/my_order_screen/my_order_screen.dart';
import 'package:get/get.dart';

import '../../../common/globs.dart';
import '../../../service/service_call.dart';
import '../../auth/login/login_screen.dart';
import '../../settings/setting_screen.dart';

class MyAccountTabController extends GetxController {
  RxList menuArr = [
    {'name': 'My Orders', 'ico': 'assets/img/my_order.png', 'order': '1'},
    {'name': 'Favorites', 'ico': 'assets/img/color_fav.png', 'order': '2'},
    {'name': 'Settings', 'ico': 'assets/img/settings.png', 'order': '3'},
    {'name': 'My Cart', 'ico': 'assets/img/my_cart.png', 'order': '4'},
    {'name': 'Rate us', 'ico': 'assets/img/rate_us.png', 'order': '5'},
    {'name': 'Refer a Friend', 'ico': 'assets/img/refer.png', 'order': '6'},
    {'name': 'Help ', 'ico': 'assets/img/help.png', 'order': '7'},
    {'name': 'Log Out', 'ico': 'assets/img/logout.png', 'order': '8'}
  ].obs;

  /// User data from API
  String get userName => ServiceCall.userObj["name"].toString();

  String get userEmail => ServiceCall.userObj["email"].toString();

  /// Handle menu actions
  void onMenuTap(String order, BuildContext context) {
    switch (order) {
      case "1":
        Get.to(MyOrderScreen());
        break;
      case "2":
        // TODO: Navigate to Favorites
      Get.to(FavoritesTabScreen());
        break;
      case "3":
        Get.to(SettingsScreen());
        break;
      case "8":
        logout(context);
        break;
      default:
    }
  }

  /// Logout logic
  void logout(BuildContext context) {
    ServiceCall.userObj = {};
    ServiceCall.userType = 0;

    Globs.udRemove(Globs.userPayload);
    Globs.udRemove(Globs.userLogin);

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
      (route) => true,
    );
  }
}
