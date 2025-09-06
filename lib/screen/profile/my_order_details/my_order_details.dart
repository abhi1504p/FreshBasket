import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:freshbasket/common/color_extension.dart';
import 'package:freshbasket/common/common_extenstion.dart';
import 'package:freshbasket/common_widgets/pop_layout.dart';
import 'package:freshbasket/common_widgets/round_button.dart';
import 'package:get/get.dart';

import '../rating_popup/rating_popup_screen.dart';
import 'my_order_details_controller.dart';

class MyOrderDetailScreen extends StatelessWidget {
  final Map obj;

  MyOrderDetailScreen({super.key, required this.obj});

  final MyOrderDetailController controller = Get.put(MyOrderDetailController());

  @override
  Widget build(BuildContext context) {
    controller.setOrder(obj);

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(Icons.arrow_back_ios, color: TColor.whiteText),
        ),
        title: Text(
          "My Order Detail",
          style: TextStyle(
            color: TColor.whiteText,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      backgroundColor: const Color(0xfffdfdfd),
      body: Obx(() {
        final data = controller.orderObj;

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Billing Info
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Billing Information:",
                        style: TextStyle(
                            color: TColor.primaryText,
                            fontSize: 17,
                            fontWeight: FontWeight.bold)),
                    Text(
                      data["payment_type"] == 1 ? "COD" : "PREPAID",
                      style: TextStyle(
                        color: data["payment_type"] == 1
                            ? Colors.orange
                            : Colors.green,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text("Name: ${data["name"]}",
                    style: TextStyle(color: TColor.primaryText, fontSize: 15)),
                Text("Mobile :${data["mobile_code"]} ${data["mobile"]}",
                    style: TextStyle(color: TColor.primaryText, fontSize: 15)),

                const SizedBox(height: 15),

                // Shipping Info
                Text("Shipping Information:",
                    style: TextStyle(
                        color: TColor.primaryText,
                        fontSize: 17,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text("${data["address"]}",
                    style: TextStyle(color: TColor.primaryText, fontSize: 15)),
                Text("Postal Code : ${data["zip_code"]}",
                    style: TextStyle(color: TColor.primaryText, fontSize: 15)),

                const SizedBox(height: 15),

                // Order Info
                Text("Order Information:",
                    style: TextStyle(
                        color: TColor.primaryText,
                        fontSize: 17,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),

                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        imageUrl: data["image"].toString(),
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  data["item_name"],
                                  style: TextStyle(
                                    color: TColor.primaryText,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Text(
                                data["created_date"] != null &&
                                        data["created_date"]
                                            .toString()
                                            .isNotEmpty
                                    ? data["created_date"]
                                        .toString()
                                        .displayDate(
                                            displayFormat:
                                                "d MMM yyyy hh:mm aa")
                                    : "",
                                style: TextStyle(
                                    color: TColor.secondaryText, fontSize: 10),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text("QTY:",
                                  style: TextStyle(
                                      color: TColor.primaryText, fontSize: 12)),
                              Text(" ${data["qty"]} X ${data["unit_name"]}",
                                  style: TextStyle(
                                      color: TColor.primaryText, fontSize: 12)),
                              const Spacer(),
                              Text(controller.statusName,
                                  style: TextStyle(
                                    color: controller.statusColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                  )),
                            ],
                          ),
                          Row(
                            children: [
                              Text("\$${data["amount"]} X ${data["qty"]}",
                                  style: TextStyle(
                                      color: TColor.primaryText, fontSize: 12)),
                              const Spacer(),
                              Text("\$${data["pay_amount"]}",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700)),
                            ],
                          ),
                          Row(
                            children: [
                              Text("Payment Type:",
                                  style: TextStyle(
                                      color: TColor.primaryText, fontSize: 12)),
                              const Spacer(),
                              Text(
                                data["payment_type"] == 1
                                    ? "Cash On Delivery"
                                    : "Prepaid",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                if (controller.canRate)
                  RoundButton(
                    title: "Rate",
                    onPressed: () {
                      Navigator.push(
                        context,
                        PopupLayout(
                          child: RatingPopupScreen(
                            didSubmit: (message, rating) {},
                          ),
                        ),
                      );
                    },
                  ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
