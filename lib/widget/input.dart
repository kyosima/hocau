import 'package:flutter/material.dart';

import '../unit.dart';

class Input extends StatelessWidget {
  String? hintText;
  Icon? icon;
  TextInputType? inputType;
  bool? enable;
  Color? borderColorInput;
  Color? bgColor;
  Input(
      {Key? key,
      this.hintText,
      this.icon,
      this.inputType,
      this.enable,
      this.borderColorInput = Colors.grey,
      this.bgColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final kW = MediaQuery.of(context).size.width;
    final kH = MediaQuery.of(context).size.height;
    return SizedBox(
      height: kW < 450 ? 48 : 60,
      child: TextFormField(
        enabled: enable,
        keyboardType: inputType,
        style: TextStyle(fontSize: kW < 450 ? 15.5 : 20.5),
        decoration: InputDecoration(
            filled: true,
            fillColor: bgColor,
            contentPadding: EdgeInsets.all(kW < 450 ? 10 : 18),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            hintText: hintText,
            prefixIcon: icon,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: pColor,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: borderColorInput!,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            )),
      ),
    );
  }
}
