import 'package:flutter/material.dart';
import 'package:freshbasket/common/common_extenstion.dart';
import 'package:freshbasket/screen/profile/my_order_screen/my_order_controller.dart';
import 'package:freshbasket/screen/profile/my_order_screen/widget/my_order_row.dart';
import 'package:get/get.dart';

import '../../../common/color_extension.dart';
import '../my_order_details/my_order_details.dart';

class MyOrderScreen extends StatelessWidget {
  MyOrderScreen({super.key});

  final controller = Get.find<MyOrderController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: TColor.whiteText,
          ),
        ),
        title: Text(
          "My Orders",
          style: TextStyle(
            color: TColor.whiteText,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
        itemBuilder: (context, index) {
          var obj = controller.orderArr[index];

          return MyOrderRow(
              obj: obj,
              onPressed: () async {
                await context.push(MyOrderDetailScreen(obj: obj));
              });
        },
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Divider(
            color: Colors.black26,
            height: 1,
          ),
        ),
        itemCount: controller.orderArr.length,
      ),
    );
  }
}
