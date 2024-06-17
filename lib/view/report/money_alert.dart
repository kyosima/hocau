import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hocau/widget/custom_text.dart';

class MoneyAlert extends StatelessWidget {
  String? title;
  String? notification;
  MoneyAlert(this.title, this.notification, {super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check_circle_outline),
          SizedBox(
            height: 10,
          ),
          CustomText(
            text: title,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          SizedBox(
            height: 10,
          ),
          CustomText(
            textAlign: TextAlign.center,
            text: notification,
            fontWeight: FontWeight.bold,
            maxLine: 5,
            color: Colors.grey,
          ),
        ],
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              child: CustomText(
                text: 'Quay lại',
                color: Colors.blue,
                fontSize: 14,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: CustomText(
                text: 'Xem chi tiết',
                color: Colors.blue,
                fontSize: 14,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        )
      ],
    );
  }
}
