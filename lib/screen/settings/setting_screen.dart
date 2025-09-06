import 'package:flutter/material.dart';
import 'package:freshbasket/screen/settings/setting_controller.dart';
import 'package:get/get.dart';
import 'package:freshbasket/common/common_extenstion.dart';
import 'package:freshbasket/screen/settings/widget/setting_row.dart';
import '../../common/color_extension.dart';


class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SettingsController());

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(Icons.arrow_back_ios, color: TColor.whiteText),
        ),
        title: Text(
          "Settings",
          style: TextStyle(
            color: TColor.whiteText,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: ListView.separated(
        padding: EdgeInsets.zero,
        itemCount: controller.settingArr.length,
        separatorBuilder: (_, __) => const Divider(color: Colors.black26, height: 0.5),
        itemBuilder: (context, index) {
          final obj = controller.settingArr[index];
          return SettingRow(
            title: obj['name']!,
            icon: obj['icon']!,
            onPressed: () => controller.onSettingTap(obj['order']!),
          );
        },
      ),
    );
  }
}
