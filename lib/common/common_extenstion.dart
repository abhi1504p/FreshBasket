import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

extension AppContext on BuildContext {
  Size get size => MediaQuery.sizeOf(this);

  double get width => size.width;

  double get height => size.height;

  Future<T?> push<T>(Widget widget) async {
    return Get.to<T>(widget);
  }

  Future pop() async {
    return Get.back();
  }
}

extension DateTimeExtension on DateTime {
  String stringFormat({String format = "yyyy-MM-dd HH:mm:ss"}) {
    return DateFormat(format).format(this);
  }
}

extension StringExtension on String {
  String displayDate(
      {String displayFormat = "dd MMM, yyyy",
      String inputFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
      int addMin = 0}) {
    var date = (DateFormat(inputFormat).parseUTC(this));
    return DateFormat(displayFormat).format(date.add(Duration(minutes: 1)));
  }

  DateTime date(
      {String inputFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'", int addMin = 0}) {
    return (DateFormat(inputFormat).parseUTC(this));
  }
}

extension MDExtensionGetX on Object {
  void mdShowAlert(String title, String message, VoidCallback onPressed,
      {String buttonTitle = "Ok",
      TextAlign mainAxisAlignment = TextAlign.center,
      bool isForce = false}) {
    Get.dialog(
      CupertinoAlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          CupertinoDialogAction(
            child: Text(buttonTitle),
            isDefaultAction: true,
            onPressed: () {
              Get.back();
              onPressed();
            },
          )
        ],
      ),
      barrierDismissible: !isForce,
    );
  }

  void mdShowAlertTowButton(String title, String message,
      VoidCallback onOkPressed, VoidCallback onCancelPressed,
      {String buttonOkTitle = "Ok",
      String buttonCancelTitle = "Cancel",
      TextAlign mainAxisAlignment = TextAlign.center,
      bool isForce = false}) {
    Get.dialog(
      CupertinoAlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Get.back();
              onOkPressed();
            },
            child: Text(buttonOkTitle),
          ),
          CupertinoDialogAction(
            isDefaultAction: false,
            onPressed: () {
              Get.back();
              onCancelPressed();
            },
            child: Text(buttonCancelTitle),
          )
        ],
      ),
      barrierDismissible: !isForce,
    );
  }

  void endEditing() {
    Get.focusScope?.unfocus();
  }
}
