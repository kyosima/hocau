import 'package:flutter/material.dart';

const pColor = Color(0xff0B894C);
const sColor = Color(0xffF97316);
const tColor = Color(0xff7C2D12);
final baseShimmer = Colors.grey.shade300;
const highLightShimmer = Colors.white;

List<BoxShadow> boxShadow = [
  BoxShadow(
    color: Colors.grey.withOpacity(0.3),
    spreadRadius: 1,
    blurRadius: 1,
    offset: Offset(0, 1), // changes position of shadow
  ),
];
const gColor = LinearGradient(
  colors: [
    Color(0xffFF9900),
    Color(0xffF5C037),
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);
