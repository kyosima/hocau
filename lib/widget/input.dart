import 'package:flutter/material.dart';

import '../unit.dart';

class Input extends StatelessWidget {
  String? initialValue;
  String? hintText;
  String? labelText;
  Icon? icon;
  Icon? sIcon;
  Function()? onPressed;
  TextInputType? inputType;
  bool? enable;
  bool? obscureText;
  Color? borderColorInput;
  Color? bgColor;
  Color? hintColor;
  Input(
      {Key? key,
      this.initialValue,
      this.hintText,
      this.sIcon,
      this.hintColor,
      this.onPressed,
      this.icon,
      this.inputType,
      this.enable,
      this.obscureText,
      this.labelText,
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
        obscureText: obscureText ?? false,
        initialValue: initialValue,
        enabled: enable,
        keyboardType: inputType,
        style: TextStyle(fontSize: kW < 450 ? 15.5 : 20.5),
        decoration: InputDecoration(
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            filled: true,
            fillColor: bgColor,
            contentPadding: EdgeInsets.all(kW < 450 ? 10 : 18),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            hintText: hintText,
            hintStyle: TextStyle(
              color: hintColor,
            ),
            prefixIcon: icon,
            suffixIcon: sIcon != null ? InkWell(onTap: onPressed, child: sIcon) : null,
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
