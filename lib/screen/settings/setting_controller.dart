import 'package:get/get.dart';

import 'account_setting/account_setting_screen.dart';
import 'address_list/address_list_screen.dart';
import 'language_setting/language_setting_screen.dart';
import 'notification_setting/notification_setting_screen.dart';

class SettingsController extends GetxController {
  final List<Map<String, String>> settingArr = [
    {'name': 'Account', 'icon': 'assets/img/account_s.png', 'order': '1'},
    {
      'name': 'Notification',
      'icon': 'assets/img/notification_s.png',
      'order': '2'
    },
    {'name': 'Language', 'icon': 'assets/img/language_s.png', 'order': '3'},
    {
      'name': 'Address List',
      'icon': 'assets/img/change_addess_s.png',
      'order': '4'
    },
  ];

  /// Handle navigation based on `order`
  void onSettingTap(String order) {
    switch (order) {
      case "1":
        Get.to(() => const AccountSettingScreen());
        break;
      case "2":
        Get.to(() => const NotificationSettingScreen());
        break;
      case "3":
        Get.to(() => const LanguageSettingScreen());
        break;
      case "4":
        Get.to(() => AddressListScreen());
        break;
      default:
    }
  }
}
