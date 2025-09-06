import 'package:flutter/material.dart';
import 'package:freshbasket/screen/settings/language_setting/pick_up_controller.dart';
import 'package:get/get.dart';
import 'package:freshbasket/common/common_extenstion.dart';

import '../../../common/color_extension.dart';


class PickupLanguageScreen extends StatelessWidget {
  final Function(Map<String, String>) onChanged;

  const PickupLanguageScreen({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PickupLanguageController>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(Icons.arrow_back_ios, color: TColor.whiteText),
        ),
        title: Text(
          "Pickup Language",
          style: TextStyle(
            color: TColor.whiteText,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: ListView.separated(
        itemCount: controller.languageList.length,
        separatorBuilder: (context, index) => Divider(
          color: Colors.black26,
          height: 1,
        ),
        itemBuilder: (context, index) {
          var obj = controller.languageList[index];
          return InkWell(
            onTap: () {
              controller.selectLanguage(obj);
              context.pop();
              onChanged(obj);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 60,
              alignment: Alignment.centerLeft,
              child: Text(
                obj["title"]!,
                style: TextStyle(
                  color: TColor.primaryText,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
