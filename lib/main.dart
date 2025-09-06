import 'package:flutter/material.dart';
import 'package:freshbasket/screen/auth/mobile_screen/mobile_login_controller.dart';
import 'package:freshbasket/screen/auth/mobile_screen/otp/otp_controller.dart';
import 'package:freshbasket/screen/auth/onboarding/onboarding_controller.dart';
import 'package:freshbasket/screen/home/detail_screen/detail_controller.dart';
import 'package:freshbasket/screen/home/home_tab_controller.dart';
import 'package:freshbasket/screen/profile/my_account_tab/my_account_tab_controller.dart';
import 'package:freshbasket/screen/profile/my_order_screen/my_order_controller.dart';
import 'package:freshbasket/screen/settings/language_setting/language_setting_controller.dart';
import 'package:freshbasket/screen/settings/language_setting/pick_up_controller.dart';
import 'package:freshbasket/screen/splash/splash_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'common/color_extension.dart';
import 'common/globs.dart';
import 'screen/tabview/main_tab_view_controller.dart';
SharedPreferences? prefs;

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
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
    Get.put(DetailController());
     Get.put(MyAccountTabController());
     Get.put(HomeController());
    Get.put(MyOrderController());
    Get.put(LanguageSettingController());
    Get.put(PickupLanguageController());

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
