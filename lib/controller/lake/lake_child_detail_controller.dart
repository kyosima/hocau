import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LakeChildBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => LakeChildController());
  }
}

class LakeChildController extends GetxController {
  final gColor = Color(0xffFFBA09).obs;

  final name = 'Suất 4 tiếng + 1 tiếng (7h-12h)'.obs;
  final icon = const Icon(
    Icons.brightness_5_outlined,
    color: Color(0xffFFBA09),
  ).obs;
  final pick = [].obs;

  void pickSeat(seat) {
    if (pick.value.contains(seat)) {
      pick.value.remove(seat);
    } else {
      pick.value.add(seat);
    }
  }
}
