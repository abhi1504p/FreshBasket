import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:freshbasket/common/common_extenstion.dart';

import '../../../../common/color_extension.dart';
import '../../../../common/globs.dart';
import '../../../../common_widgets/round_button.dart';

class OtpScreen extends StatefulWidget {
  final Map<String, dynamic> passValue;

  const OtpScreen({super.key, required this.passValue});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String otpCode = "";

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
                  showFieldAsBox: true,
                  borderRadius: BorderRadius.circular(25),
                  fillColor: Color(0xffF0F0F0),
                  //runs when a code is typed in
                  onCodeChanged: (String code) {
                    otpCode = code;
                    //handle validation or checks here
                  },
                  //runs when every textfield is filled
                  onSubmit: (String verificationCode) {
                    otpCode = verificationCode;
                    clkVerify();
                  }, // end onSubmit
                ),
              ),
              RoundButton(
                  title: "VERIFY",
                  onPressed: () {
                    clkVerify();
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      apiCallingLogin(widget.passValue);
                    },
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

  //TODO: Action
  void clkVerify() {
    if (otpCode.length != 6) {
      mdShowAlert(Globs.appName, "Please enter valid otp", () {});
      return;
    }
    endEditing();
    widget.passValue["otp_code"] = otpCode;
    apiCallingVerifyLogin(widget.passValue);
  }

  //TODO: Api Calling

  void apiCallingVerifyLogin(Map<String, dynamic> parameter) {
    Globs.showHUD();
  }

  void apiCallingLogin(Map<String, dynamic> parameter) {
    Globs.showHUD();
  }
}
