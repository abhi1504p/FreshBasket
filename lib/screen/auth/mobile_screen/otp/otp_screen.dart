import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:freshbasket/common/common_extenstion.dart';
import 'package:freshbasket/screen/auth/mobile_screen/otp/otp_controller.dart';
import 'package:get/get.dart';

import '../../../../common/color_extension.dart';
import '../../../../common_widgets/round_button.dart';
import '../../name_address/name_address_screen.dart';

class OtpScreen extends StatelessWidget {
  final Map<String, dynamic> passValue;

  OtpScreen({super.key, required this.passValue});

  final controller = Get.find<OtpController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: TColor.primaryText,
          ),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Enter The 6 digit code that was\nsend to your Mobile Number",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: OtpTextField(
                  numberOfFields: 6,
                  fieldHeight: 50,
                  borderColor: TColor.primary,
                  fieldWidth: 50,
                  filled: true,
                  focusedBorderColor: TColor.primary,
                  enabledBorderColor: Color(0xffF0F0F0),
                  //set to true to show as box or false to show as dash
                  showFieldAsBox: false,

                  fillColor: Color(0xffF0F0F0),
                  //runs when a code is typed in
                  onCodeChanged: (String code) {
                    controller.otpCode.value = code;
                    //handle validation or checks here
                  },
                  //runs when every textfield is filled
                  onSubmit: (String verificationCode) {
                    controller.otpCode.value = verificationCode;
                    controller.clkVerify();
                  }, // end onSubmit
                ),
              ),
              RoundButton(
                  title: "VERIFY",
                  onPressed: () {
                    controller.clkVerify();

                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Resend Again?",
                      style: TextStyle(color: Colors.blue, fontSize: 10),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
