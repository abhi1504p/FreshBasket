import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RatingPopupController extends GetxController {
  final TextEditingController txtMessage = TextEditingController();
  final RxDouble rating = 5.0.obs;

  void updateRating(double value) {
    rating.value = value;
  }

  void clearData() {
    txtMessage.clear();
    rating.value = 5.0;
  }

  @override
  void onClose() {
    txtMessage.dispose();
    super.onClose();
  }
}
