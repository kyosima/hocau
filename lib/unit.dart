import 'package:flutter/material.dart';

const pColor = Color(0xff0B894C);
const sColor = Color(0xfffc8c04);
final baseShimmer = Colors.grey.shade300;
const highLightShimmer = Colors.white;

List<BoxShadow> boxShadow = [
  BoxShadow(
    color: Colors.grey.withOpacity(0.5),
    spreadRadius: 1,
    blurRadius: 2,
    offset: Offset(0, 1), // changes position of shadow
  ),
];
const gColor = LinearGradient(
  colors: [
    pColor,
    sColor,
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);
