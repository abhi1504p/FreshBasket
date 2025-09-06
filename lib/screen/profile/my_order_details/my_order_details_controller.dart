import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyOrderDetailController extends GetxController {
  final RxMap orderObj = {
    'Name:': "Abhishek",
    'Mobile': 123456789,
  }.obs;

  void setOrder(Map obj) {
    orderObj.value = obj;
  }

  String get statusName {
    switch (orderObj["order_status"].toString()) {
      case "1":
        return "Order Processing";
      case "2":
        return "Shipping";
      case "3":
        return "Out for Delivery";
      case "4":
        return "Delivered";
      case "5":
      case "6":
        return "Cancel";
      case "7":
        return "Order Reject";
      default:
        return "New";
    }
  }

  Color get statusColor {
    switch (orderObj["order_status"].toString()) {
      case "1":
        return Colors.blueAccent;
      case "2":
        return Colors.amber;
      case "3":
        return Colors.orange;
      case "4":
        return Colors.green;
      case "5":
      case "6":
      case "7":
        return Colors.red;
      default:
        return Colors.blue;
    }
  }

  bool get canRate {
    return orderObj["order_status"] == 4 &&
        ((double.tryParse(orderObj["rating"].toString()) ?? 0.0) < 1.0);
  }
}
