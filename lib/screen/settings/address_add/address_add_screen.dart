import 'package:flutter/material.dart';
import 'package:freshbasket/common/common_extenstion.dart';
import 'package:get/get.dart';

import '../../../common/color_extension.dart';
import '../../../common_widgets/round_button.dart';
import '../../../common_widgets/round_textfield.dart';
import 'address_add_controller.dart';

class AddressAddScreen extends StatelessWidget {
  final Map? obj;
  final bool isEdit;

  const AddressAddScreen({super.key, this.obj, this.isEdit = false});

  @override
  Widget build(BuildContext context) {
    final AddressAddController controller = Get.put(AddressAddController())
      ..initData(obj);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(Icons.arrow_back_ios, color: TColor.whiteText),
        ),
        title: Text(
          isEdit ? "Edit Address" : "Add Address",
          style: TextStyle(
              color: TColor.whiteText,
              fontSize: 14,
              fontWeight: FontWeight.w500),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildLabel("Name"),
                RoundTextfield(controller: controller.txtName, hintText: ""),
                _buildLabel("Address"),
                RoundTextfield(
                    controller: controller.txtAddress,
                    hintText: "",
                    minLine: 6,
                    maxLine: 10),
                _buildLabel("City"),
                RoundTextfield(controller: controller.txtCity, hintText: ""),
                _buildLabel("Zip Code"),
                RoundTextfield(controller: controller.txtZipCode, hintText: "",keyboardType: TextInputType.phone,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(child: _buildLabel("Latitude")),
                    const SizedBox(width: 15),
                    Expanded(child: _buildLabel("Longitude")),
                    const SizedBox(width: 30),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                              child: RoundTextfield(
                                  controller: controller.txtLatitude,
                                  hintText: "")),
                          const SizedBox(width: 15),
                          Expanded(
                              child: RoundTextfield(
                                  controller: controller.txtLongitude,
                                  hintText: "")),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () => controller.pickLocation(context),
                      icon: const Icon(Icons.pin_drop),
                    )
                  ],
                ),
                const SizedBox(height: 40),
                RoundButton(
                  title: isEdit ? "Update" : "Add",
                  onPressed: () {
                    final data = controller.validateAndGetData();
                    if (data != null) {
                      Get.back(
                          result: data); // send back data to AddressListScreen
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          color: TColor.primaryText,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
