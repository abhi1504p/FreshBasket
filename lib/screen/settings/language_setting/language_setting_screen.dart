import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:freshbasket/common/common_extenstion.dart';
import 'package:freshbasket/screen/settings/language_setting/pick_up_langauge_screen.dart';

import '../../../common/color_extension.dart';
import 'language_setting_controller.dart';

class LanguageSettingScreen extends StatelessWidget {
  const LanguageSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LanguageSettingController>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(Icons.arrow_back_ios, color: TColor.whiteText),
        ),
        title: Text(
          "Language Setting",
          style: TextStyle(
            color: TColor.whiteText,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Language",
                style: TextStyle(
                  color: TColor.secondaryText,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                context.push(PickupLanguageScreen(
                  onChanged: (newSelect) {

                  },
                ));
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 60,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Language",
                        style: TextStyle(
                          color: TColor.primaryText,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Obx(() => Text(
                      controller.selectedLanguage.value,
                      style: TextStyle(
                        color: TColor.primaryText,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
                    Icon(Icons.keyboard_arrow_right,
                        color: TColor.primaryText)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
