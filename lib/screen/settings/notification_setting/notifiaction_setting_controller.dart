import 'package:get/get.dart';

class NotificationSettingController extends GetxController {
  final RxList<Map<String, dynamic>> settingArr = [
    {
      'title': 'My Account',
      'subtitle': 'You will receive daily updates',
      'value': true,
      'order': '1'
    },
    {
      'title': 'Promotional Notifications',
      'subtitle': 'You will receive daily updates',
      'value': false,
      'order': '2'
    }
  ].obs;

  /// Toggle switch value
  void toggleSwitch(int index, bool newVal) {
    settingArr[index]['value'] = newVal;
    settingArr.refresh(); // refresh UI
  }
}
