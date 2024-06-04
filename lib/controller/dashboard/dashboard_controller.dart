import 'package:get/get.dart';
import 'package:hocau/view/home/home_page.dart';
import 'package:hocau/view/lake/lake_near_me_page.dart';

class DashboardBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => DashboardController());
  }
}

class DashboardController extends GetxController {
  final selectedTab = 0.obs;
  final isLoading = false.obs;
  final pages = [
    HomePage(),
    LakeNearMePage(),
    HomePage(),
    HomePage(),
  ];
  void changeTab(index) {
    selectedTab.value = index;
  }
}
