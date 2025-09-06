import 'package:flutter/material.dart';
import 'package:freshbasket/common/common_extenstion.dart';
import 'package:freshbasket/screen/settings/address_list/widget/address_row.dart';
import 'package:get/get.dart';

import '../../../common/color_extension.dart';
import '../address_add/address_add_screen.dart';
import 'address_list_controller.dart';

class AddressListScreen extends StatelessWidget {
  final bool isPicker;
  final Function(Map)? didSelect;

  const AddressListScreen({super.key, this.isPicker = false, this.didSelect});

  TextStyle get titleStyle => TextStyle(
        color: TColor.whiteText,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      );

  TextStyle get emptyStyle => TextStyle(
        color: TColor.secondaryText,
        fontSize: 25,
        fontWeight: FontWeight.w700,
      );

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(Icons.arrow_back_ios, color: TColor.whiteText),
        ),
        title: Text("Address List", style: titleStyle),
        actions: [
          IconButton(
            icon: Icon(Icons.add, color: TColor.whiteText),
            onPressed: () async {
              final result = await context.push(AddressAddScreen());
              if (result != null) controller.addAddress(result);
            },
          )
        ],
      ),
      body: Obx(() {
        if (controller.addressArr.isEmpty) {
          return Center(child: Text("No Address List", style: emptyStyle));
        }
        return ListView.separated(
          itemCount: controller.addressArr.length,
          separatorBuilder: (_, __) =>
              Divider(color: Colors.black26, height: 0.5),
          itemBuilder: (_, index) {
            final obj = controller.addressArr[index];
            return AddressRow(
              obj: obj,
              onPressed: () {
                if (isPicker && didSelect != null) {
                  didSelect!(obj);
                  context.pop();
                }
              },
              onDelete: () => controller.deleteAddress(index),
              onEdit: () async {
                final updated = await context
                    .push(AddressAddScreen(isEdit: true, obj: obj));
                if (updated != null) controller.updateAddress(index, updated);
              },
            );
          },
        );
      }),
    );
  }
}
