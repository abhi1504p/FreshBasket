import 'package:get/get.dart';
import 'package:flutter/material.dart';

class OnboardingController extends GetxController {
  List pageArray = [
    {
      "img": "assets/img/in_1.png",
      "title": "E Shopping",
      "subtitle": "Explore  top organic fruits & grab them"
    },
    {
      "img": "assets/img/in_2.png",
      "title": "Delivery on the way",
      "subtitle": "Get your order by speed delivery"
    },
    {
      "img": "assets/img/in_3.png",
      "title": "Delivery Arrived",
      "subtitle": "Order is arrived at your Place"
    },
  ];
  RxInt selectPage = 0.obs;
  late final PageController pageController;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  void goToNextPage() {
    if (selectPage.value < pageArray.length - 1) {
      selectPage.value++;
      pageController.animateToPage(
        selectPage.value,
        duration: Duration(milliseconds: 200),
        curve: Curves.bounceInOut,
      );
    }
  }

  void onPageChanged(int index) {
    selectPage.value = index;
  }
}