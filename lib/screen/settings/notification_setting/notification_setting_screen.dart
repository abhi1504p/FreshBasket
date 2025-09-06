import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:freshbasket/common/common_extenstion.dart';
import '../../../common/color_extension.dart';
import 'notifiaction_setting_controller.dart';


class NotificationSettingScreen extends StatelessWidget {
  const NotificationSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NotificationSettingController());

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(Icons.arrow_back_ios, color: TColor.whiteText),
        ),
        title: Text(
          "Notification Setting",
          style: TextStyle(
            color: TColor.whiteText,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Obx(() => ListView.separated(
        itemCount: controller.settingArr.length,
        separatorBuilder: (_, __) =>
        const Divider(color: Colors.black26, height: 1),
        itemBuilder: (context, index) {
          final obj = controller.settingArr[index];
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: 60,
            child: Row(
              children: [
                Image.asset(
                  "assets/img/notification_s.png",
                  width: 30,
                  height: 30,
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        obj["title"],
                        style: TextStyle(
                          color: TColor.primaryText,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        obj["subtitle"],
                        style: TextStyle(
                          color: TColor.secondaryText,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
                Switch(
                  value: obj["value"],
                  activeColor: TColor.primary,
                  onChanged: (newVal) =>
                      controller.toggleSwitch(index, newVal),
                )
              ],
            ),
          );
        },
      )),
    );
  }
}
