import 'package:flutter/material.dart';

import '../unit.dart';
import 'custom_text.dart';

class ButtonAccount extends StatelessWidget {
  Function()? onTap;
  String? title;
  IconData? icon;
  ButtonAccount({Key? key, this.onTap, this.title, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final kW = MediaQuery.of(context).size.width;
    final kH = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: onTap,
      child: Container(
        width: kW,
        height: kW < 450 ? 50 : 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: pColor)),
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Icon(icon),
                    SizedBox(
                      width: 8,
                    ),
                    CustomText(
                      text: title,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
              Icon(Icons.chevron_right)
            ],
          ),
        ),
      ),
    );
  }
}
