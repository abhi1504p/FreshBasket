import 'package:freshbasket/common/common_extenstion.dart';
import 'package:freshbasket/screen/auth/name_address/name_address_screen.dart';
import 'package:get/get.dart';

import '../../../../common/globs.dart';

class OtpController extends GetxController{
  RxString otpCode = "".obs;
  //TODO: Action
  void clkVerify() {
    if (otpCode.value.length != 6) {
      mdShowAlert(Globs.appName, "Please enter valid otp", () {});
      Get.to(NameAddressScreen());
      return;

    }
    endEditing();

  }
}