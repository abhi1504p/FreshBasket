import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:freshbasket/common/common_extenstion.dart';
import 'package:get/get.dart';

import '../../../common/globs.dart';

class MobileLoginController extends GetxController {
  final countryPicker = const FlCountryCodePicker();
  late Rx<CountryCode> countryCode;
  final txtMobile = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    countryCode = Rx<CountryCode>(
      countryPicker.countryCodes.firstWhere((item) => item.name == "India"),
    );
  }

  void updateCountryCode(CountryCode code) {
    countryCode.value = code;
  }

  void verify(){
    if(txtMobile.text.length<10){
      mdShowAlert(Globs.appName, "Please enter valid mobile number", () {});
      return;
    }

  }

  @override
  void onClose() {
    txtMobile.dispose();
    super.onClose();
  }
}
