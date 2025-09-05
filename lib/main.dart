import 'package:flutter/material.dart';
import 'package:freshbasket/screen/auth/mobile_screen/mobile_login_controller.dart';
import 'package:freshbasket/screen/auth/mobile_screen/otp/otp_controller.dart';
import 'package:freshbasket/screen/auth/onboarding/onboarding_controller.dart';
import 'package:freshbasket/screen/splash/splash_screen.dart';
import 'package:get/get.dart';

import 'common/color_extension.dart';
import 'common/globs.dart';
import 'screen/tabview/main_tab_view_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(OnboardingController());
    Get.put(MobileLoginController());
    Get.put(OtpController());
    Get.put(MainTabViewController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: Globs.appName,
      theme: ThemeData(
          fontFamily: "Poppins",
          scaffoldBackgroundColor: TColor.bg,
          colorScheme: ColorScheme.fromSeed(seedColor: TColor.primary),
          useMaterial3: false,
          appBarTheme: AppBarTheme(
            backgroundColor: TColor.primary,
            elevation: 0,
          )),
      home: const SplashScreen(),
    );
  }
}
