import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:freshbasket/common/common_extenstion.dart';
import 'package:get/get.dart';


import '../../../common/color_extension.dart';
import '../../../common_widgets/round_button.dart';
import '../../../common_widgets/round_textfield.dart';
import 'rating_popup_controller.dart';

class RatingPopupScreen extends StatelessWidget {
  final Function(String, double) didSubmit;

  const RatingPopupScreen({super.key, required this.didSubmit});

  @override
  Widget build(BuildContext context) {
    final RatingPopupController controller = Get.put(RatingPopupController());

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black12, offset: Offset(0, -2), blurRadius: 4)
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      width: AppContext(context).width * 0.8,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Rating & Review",
                style: TextStyle(
                  color: TColor.primaryText,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              IconButton(
                onPressed: () => context.pop(),
                icon: Icon(Icons.close, color: TColor.primary, size: 25),
              ),
            ],
          ),
          const SizedBox(height: 15),

          // Rating Stars
          Obx(() => RatingBar.builder(
            initialRating: controller.rating.value,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemSize: 50,
            itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
            itemBuilder: (context, _) =>
            const Icon(Icons.star, color: Colors.orange),
            onRatingUpdate: controller.updateRating,
          )),
          const SizedBox(height: 15),

          // Review Label
          Text(
            "Review Message",
            style: TextStyle(
              fontSize: 16,
              color: TColor.primaryText,
              fontWeight: FontWeight.w600,
            ),
          ),

          // Text Field
          RoundTextfield(
            hintText: "",
            controller: controller.txtMessage,
            minLine: 6,
            maxLine: 10,
          ),

          // Submit Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
            child: RoundButton(
              title: "Submit",
              onPressed: () {
                context.pop();
                didSubmit(controller.txtMessage.text, controller.rating.value);
                controller.clearData();
              },
            ),
          ),
        ],
      ),
    );
  }
}
