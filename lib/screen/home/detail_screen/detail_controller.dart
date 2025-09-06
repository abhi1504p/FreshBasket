import 'package:get/get.dart';

class DetailController extends GetxController {
  RxMap? detailObj;
  RxList nutritionArr = [
    {"name": "Calories: 52 kcal"},
    {"name": "Carbohydrates: 14 g"},
    {"name": "Fiber: 2.4 g"},
    {"name": "Vitamin C: 7% of RDI"},
    {"name": "Potassium: 107 mg"},
  ].obs;
  RxList reviewArr = [
    {"name": "Amit", "message": "Very fresh and sweet!", "rate": 5},
    {
      "name": "Sneha",
      "message": "Good quality but a bit expensive.",
      "rate": 4
    },
  ].obs;
}
