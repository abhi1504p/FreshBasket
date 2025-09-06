import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:freshbasket/common/common_extenstion.dart';
import 'package:freshbasket/screen/home/detail_screen/detail_controller.dart';
import 'package:get/get.dart';

import '../../../common/color_extension.dart';
import '../../../common_widgets/review_row.dart';
import '../../../common_widgets/round_button.dart';

class DetailScreen extends StatelessWidget {
  final Map obj;

  DetailScreen({super.key, required this.obj});

  final DetailController detailController = Get.find<DetailController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: TColor.whiteText,
          ),
        ),
        centerTitle: false,
        title: Text(
          "Details",
          style: TextStyle(
            color: TColor.whiteText,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$${obj["amount"]} per/ ${obj["unit_name"]}",
                style: TextStyle(
                  color: TColor.primaryText,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              RoundButton(
                  title: "Buy Now", width: 140, height: 44, onPressed: () {})
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 25,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: CachedNetworkImage(
                  imageUrl: obj["image"].toString(),
                  width: double.maxFinite,
                  height: AppContext(context).width * 0.45,
                  fit: BoxFit.values.first,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                obj["item_name"].toString(),
                style: TextStyle(
                  color: TColor.primaryText,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  obj["description"].toString(),
                  style: TextStyle(
                    color: TColor.secondaryText,
                    fontSize: 12,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Nutrition",
                style: TextStyle(
                  color: TColor.primaryText,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var nObj = detailController.nutritionArr[index];

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        margin: const EdgeInsets.only(right: 15),
                        decoration: BoxDecoration(
                            color: TColor.secondaryText,
                            borderRadius: BorderRadius.circular(4)),
                      ),
                      Expanded(
                        child: Text(
                          nObj["name"].toString(),
                          style: TextStyle(
                            color: TColor.secondaryText,
                            fontSize: 12,
                          ),
                        ),
                      )
                    ],
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: 12,
                ),
                itemCount: detailController.nutritionArr.length,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "User Reviews",
                style: TextStyle(
                  color: TColor.primaryText,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var obj = detailController.reviewArr[index];

                  return ReviewRow(obj: obj);
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: 12,
                ),
                itemCount: detailController.reviewArr.length,
              )
            ],
          ),
        ),
      ),
    );
  }
}
