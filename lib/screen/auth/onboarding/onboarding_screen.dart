import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/color_extension.dart';
import '../../../common_widgets/round_button.dart';
import '../login/login_screen.dart';
import 'onboarding_controller.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final onboardingController = Get.find<OnboardingController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: onboardingController.pageController,
            onPageChanged: onboardingController.onPageChanged,
            itemBuilder: (context, index) {
              var pObj = onboardingController.pageArray[index];
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                margin: EdgeInsets.symmetric(vertical: context.width * 0.25),
                child: Column(
                  children: [
                    Image.asset(
                      pObj["img"],
                      fit: BoxFit.fitWidth,
                      width: context.width,
                      height: context.width,
                    ),
                    Text(
                      pObj["title"],
                      style: TextStyle(
                        color: TColor.primaryText,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      pObj["subtitle"],
                      style: TextStyle(
                        color: TColor.secondaryText,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              );
            },
            itemCount: onboardingController.pageArray.length,
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(() {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (onboardingController.selectPage.value !=
                          onboardingController.pageArray.length - 1)
                        TextButton(
                            onPressed: () {
                              loadNextScreen();
                            },
                            child: Text(
                              "Skip",
                              style: TextStyle(
                                color: TColor.secondaryText,
                                fontSize: 14,
                              ),
                            ))
                    ],
                  );
                }),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: onboardingController.pageArray.map((pObj) {
                    var index = onboardingController.pageArray.indexOf(pObj);
                    return Obx(() {
                      return Container(
                        width: 12,
                        height: 12,
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                            color:
                                onboardingController.selectPage.value == index
                                    ? TColor.active
                                    : Colors.transparent,
                            border: Border.all(color: TColor.active, width: 1),
                            borderRadius: BorderRadius.circular(6)),
                      );
                    });
                  }).toList(),
                ),
                SizedBox(
                  height: context.width * 0.22,
                ),
                Obx(() {
                  return RoundButton(
                      title: onboardingController.selectPage.value ==
                              onboardingController.pageArray.length - 1
                          ? "Get Started"
                          : "Next",
                      width: 150,
                      onPressed: () {
                        if (onboardingController.selectPage.value ==
                            onboardingController.pageArray.length - 1) {
                          loadNextScreen();
                        } else {
                          onboardingController.goToNextPage();
                        }
                      });
                }),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void loadNextScreen() {
    Get.to(LoginScreen());
  }
}
