import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freshbasket/common/common_extenstion.dart';

import '../../common/color_extension.dart';
import '../../common/globs.dart';
import '../auth/onboarding/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    load();
  }

  void load() async {
    await Future.delayed(
      const Duration(seconds: 3),
    );
    loadScreen();
  }

  void loadScreen() {
    context.push( OnboardingScreen());
  }

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: TColor.primary,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: double.maxFinite,
            height: context.height,
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              "assets/img/splash_bottom.png",
              width: double.maxFinite,
              fit: BoxFit.fitWidth,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: context.height * 0.15),
            child: Text(
              Globs.appName,
              style: TextStyle(
                color: TColor.whiteText,
                fontSize: 45,
                fontWeight: FontWeight.w700,
              ),
            ),
          )
        ],
      ),
    );
  }
}
