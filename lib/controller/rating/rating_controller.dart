import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RatingController extends GetxController {
  final rating = 1.obs;
  final ratingColor = [
    Colors.white,
    Color(0xff96c7ff),
    Color(0xff195ca8),
    Color(0xff001f42),
    Color(0xff111827),
    Color(0xfffba612),
  ].obs;

  void rtColor(value) {
    rating.value = value;
  }
}
