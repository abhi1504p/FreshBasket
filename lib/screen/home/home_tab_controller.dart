import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt selectTab = 0.obs;

  final List<Map<String, dynamic>> categoryArr = [
    {"main_cat_name": "Fruits"},
    {"main_cat_name": "Vegetables"},
    {"main_cat_name": "Dairy"},
  ];

  final List<Map<String, dynamic>> subCategoryArr = [
    {
      "cat_name": "Fresh Fruits",
      "subtitle": "Best quality seasonal fruits",
      "items": [
        {
          "item_name": "Apple",
          "amount": "120",
          "unit_name": "kg",
          "rate": "4.5",
          "image":
          "https://upload.wikimedia.org/wikipedia/commons/1/15/Red_Apple.jpg"
        },
        {
          "item_name": "Banana",
          "amount": "60",
          "unit_name": "dozen",
          "rate": "4.0",
          "image":
          "https://upload.wikimedia.org/wikipedia/commons/8/8a/Banana-Single.jpg"
        },
        {
          "item_name": "Mango",
          "amount": "150",
          "unit_name": "kg",
          "rate": "5.0",
          "image":
          "https://upload.wikimedia.org/wikipedia/commons/9/90/Hapus_Mango.jpg"
        },
      ]
    },
    {
      "cat_name": "Green Vegetables",
      "subtitle": "Organic and fresh",
      "items": [
        {
          "item_name": "Spinach",
          "amount": "40",
          "unit_name": "bunch",
          "rate": "4.2",
          "image":
          "https://upload.wikimedia.org/wikipedia/commons/0/05/Spinach_leaves.jpg"
        },
        {
          "item_name": "Broccoli",
          "amount": "80",
          "unit_name": "pc",
          "rate": "4.3",
          "image":
          "https://upload.wikimedia.org/wikipedia/commons/0/03/Broccoli_and_cross_section_edit.jpg"
        },
      ]
    },
    {
      "cat_name": "Milk Products",
      "subtitle": "Daily essentials",
      "items": [
        {
          "item_name": "Milk",
          "amount": "50",
          "unit_name": "ltr",
          "rate": "4.8",
          "image":
          "https://upload.wikimedia.org/wikipedia/commons/a/a2/Milk_glass.jpg"
        },
        {
          "item_name": "Cheese",
          "amount": "200",
          "unit_name": "kg",
          "rate": "4.6",
          "image":
          "https://upload.wikimedia.org/wikipedia/commons/4/4b/Cheese_platter.jpg"
        },
      ]
    },
  ];

  void changeTab(int index) {
    selectTab.value = index;
  }
}
