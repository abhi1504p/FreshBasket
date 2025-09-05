import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/color_extension.dart';
import '../../../common_widgets/round_button.dart';
import 'mobile_login_controller.dart';

class MobileLoginScreen extends StatelessWidget {
  const MobileLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MobileLoginController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Get.back();
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
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: TColor.secondaryText,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () async {
                          final code = await controller.countryPicker
                              .showPicker(context: context);

                          if (code != null) {
                            controller.updateCountryCode(code);
                          }
                        },
                        child: Obx(() =>
                            Container(
                              width: 80,
                              height: 50,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: TColor.secondaryText, width: 1),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                " ${controller.countryCode.value.dialCode}",
                                style: TextStyle(
                                  color: TColor.primaryText,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            )),
                      ),
                      Expanded(
                        child: TextField(
                          controller: controller.txtMobile,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            contentPadding:
                            const EdgeInsets.symmetric(horizontal: 15),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            hintText: "Ex: 9876543210",
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                RoundButton(
                      title: "VERIFY",
                      onPressed: () {
                        controller.verify();
                      })

              ],
            ),
          )),
    );
  }


}
