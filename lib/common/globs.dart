import 'package:flutter_easyloading/flutter_easyloading.dart';

class Globs {
  static const appName = "Fresh basket";

  static void showHUD({String status = "loading ...."}) async {
    await Future.delayed(const Duration(milliseconds: 1));
    EasyLoading.show(status: status);
  }

  static void hideHUD() {
    EasyLoading.dismiss();
  }
}
