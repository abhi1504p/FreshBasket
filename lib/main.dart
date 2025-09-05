import 'package:flutter/material.dart';
import 'package:freshbasket/screen/auth/onboarding/onboarding_controller.dart';
import 'package:freshbasket/screen/splash/splash_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'common/color_extension.dart';
import 'common/globs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(Globs());
    Get.put(TColor());
    Get.put(OnboardingController());
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
