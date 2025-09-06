import 'package:flutter/material.dart';
import 'package:freshbasket/screen/profile/my_account_tab/my_account_tab_controller.dart';
import 'package:get/get.dart';

import '../../../common/color_extension.dart';
import '../../../common/common_extenstion.dart';

class MyAccountTabScreen extends StatelessWidget {
  const MyAccountTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MyAccountTabController>();

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Header with user info
          Container(
            width: AppContext(context).width,
            color: TColor.primary,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Container(
                          width: 110,
                          height: 110,
                          padding: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(55),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 2,
                              )
                            ],
                          ),
                          child: Image.asset(
                            "assets/img/user_placeholder.png",
                            width: double.maxFinite,
                            height: double.maxFinite,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          right: 15,
                          top: 0,
                          child: IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                              "assets/img/edit.png",
                              width: 25,
                              height: 25,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  controller.userName,
                  style: TextStyle(
                    color: TColor.whiteText,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  controller.userEmail,
                  style: TextStyle(
                    color: TColor.whiteText,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),

          /// Menu list
          Expanded(
            child: Obx(() => ListView.separated(
                  itemCount: controller.menuArr.length,
                  separatorBuilder: (context, index) => const Divider(
                    color: Colors.black26,
                    height: 0.5,
                  ),
                  itemBuilder: (context, index) {
                    var obj = controller.menuArr[index];
                    return ListTile(
                      leading: Image.asset(obj['ico'].toString(), width: 25),
                      title: Text(obj['name'].toString()),
                      onTap: () => controller.onMenuTap(
                          obj["order"].toString(), context),
                    );
                  },
                )),
          ),
        ],
      ),
    );
  }
}
