import 'package:flutter/material.dart';
import 'package:freshbasket/common/common_extenstion.dart';
import 'package:freshbasket/screen/tabview/main_tab_view_screen.dart';

import '../../../common/color_extension.dart';
import '../../../common_widgets/round_button.dart';
import '../../../common_widgets/round_textfield.dart';

class NameAddressScreen extends StatefulWidget {
  const NameAddressScreen({super.key});

  @override
  State<NameAddressScreen> createState() => _NameAddressScreenState();
}

class _NameAddressScreenState extends State<NameAddressScreen> {
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Text(
                  "Enter Your Name",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: TColor.primaryText,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              RoundTextfield(hintText: "Ex: Code for Any"),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Text(
                  "Add Address",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: TColor.primaryText,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              RoundTextfield(
                hintText: "",
                minLine: 6,
                maxLine: 10,
              ),
              SizedBox(
                height: 40,
              ),
              RoundButton(title: "VERIFY", onPressed: () {
                context.push(MainTabViewScreen());
              }),
            ],
          ),
        ),
      )),
    );
  }
}
