import 'dart:ui';

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
}
