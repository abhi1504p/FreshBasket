import 'package:flutter/material.dart';
import 'package:freshbasket/common/common_extenstion.dart';
import 'package:freshbasket/screen/notfication/notification_screen.dart';

import 'package:get/get.dart';

import '../../common/color_extension.dart';
import '../../common_widgets/section_title_subtitle.dart';
import '../../common_widgets/select_button.dart';
import 'detail_screen/detail_screen.dart';
import 'fruit_cell.dart';
import 'home_tab_controller.dart';

class HomeTabScreen extends StatelessWidget {
  const HomeTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: Container(),
        leadingWidth: 15,
        title: const Text(
          "Fresh Basket",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(()=>NotificationScreen());
            },
            icon: const Icon(Icons.notifications, color: Colors.white),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  color: TColor.primary,
                  width: double.maxFinite,
                  height: 50,
                ),
                Container(
                  margin: const EdgeInsets.only(
                      top: 20, left: 20, right: 20, bottom: 4),
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 2,
                      ),
                    ],
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 15,
                      ),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: "Search",
                      prefixIcon: Icon(
                        Icons.search,
                        color: TColor.placeholder,
                      ),
                      hintStyle: TextStyle(
                        color: TColor.placeholder,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Obx(() {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: controller.categoryArr.map((catObj) {
                    var index = controller.categoryArr.indexOf(catObj);
                    return Expanded(
                        child: SelectButton(
                      title: catObj["main_cat_name"].toString(),
                      isSelect: controller.selectTab.value == index,
                      onPressed: () {
                        controller.changeTab(index);
                      },
                    ));
                  }).toList(),
                );
              }),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.subCategoryArr.length,
              itemBuilder: (context, index) {
                var obj = controller.subCategoryArr[index];
                var itemArr = obj["items"] as List? ?? [];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SectionTitleSubtitle(
                      title: obj["cat_name"].toString(),
                      offerTitle: "",
                      subtitle: obj["subtitle"].toString(),
                    ),
                    SizedBox(
                      height: AppContext(context).width * 0.42 + 80,
                      child: ListView.separated(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 8),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          var itemObj = itemArr[index];
                          return FruitsCell(
                            obj: itemObj,
                            onPressed: () {
                              Get.to(DetailScreen(obj: itemObj));
                            },
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 20),
                        itemCount: itemArr.length,
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
