import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hocau/controller/dashboard/dashboard_controller.dart';

import '../../unit.dart';

class DashboardPage extends StatelessWidget {
  final controller = Get.put(DashboardController());
  DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final kW = MediaQuery.of(context).size.width;
    final kH = MediaQuery.of(context).size.height;
    return Obx(() => Scaffold(
          body: controller.pages[controller.selectedTab.value],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.selectedTab.value,
            onTap: (index) => controller.changeTab(index),
            selectedItemColor: pColor,
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
            unselectedFontSize: kW < 450 ? 13 : 18,
            selectedFontSize: kW < 450 ? 13 : 18,
            iconSize: kW < 450 ? 28 : 35,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), label: "Trang chủ"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.map_outlined), label: "Hồ gần đây"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.card_giftcard_outlined), label: "Sự kiện"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_today_outlined), label: "Đặt lịch"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle_outlined),
                  label: "Tài khoản"),
            ],
          ),
        ));
  }
}
