import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hocau/widget/custom_text.dart';

import '../../unit.dart';
import '../../widget/button_account.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class EventController extends GetxController {
  var giftsDistributed = 10.obs;
}

class EventDetailPage extends StatelessWidget {
  final EventController controller = Get.put(EventController());

  @override
  Widget build(BuildContext context) {
    final kW = MediaQuery.of(context).size.width;
    final kH = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Chi tiết sự kiện',
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/hoca.png',
              width: double.infinity,
              //height: 200,
            ),
            SizedBox(height: 16.0),
            Text(
              'Tham gia quét mã nhận quà',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                Icon(Icons.location_on, color: Colors.green),
                SizedBox(width: 8.0),
                Text('Hồ câu Hoàng Hải'),
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                Icon(
                  Icons.card_giftcard,
                  color: Colors.orange,
                ),
                SizedBox(width: 8.0),
                Expanded(
                  child: Text(
                    '1 chiếc cần câu lua máy đứng SHIMANO WORLD SHAULA, trị giá 13.000.000đ',
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.lock_clock_outlined),
                SizedBox(height: 8.0),
                Text('Mở từ 16/06/2024 đến hết 30/06/2024'),
                SizedBox(height: 8.0),
              ],
            ),
            Obx(() =>
                Text('Đã phát ${controller.giftsDistributed}/100 phần quà')),
            SizedBox(height: 16.0),
            Text(
              'Điều kiện tham gia',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Text('• Có điểm CCV từ 20 trở lên'),
            Text('• Có xếp loại Chuẩn Cần Thủ trở lên'),
            SizedBox(height: 16.0),
            Text(
              'Cách thức tham gia',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Text(
                '• Cần thứ đến vị trí tổ chức sự kiện và tham gia bằng cách quét mã QR sự kiện, sau đó bạn sẽ nhận được một mã nhận quà từ hệ thống, dùng mã đó đưa cho người tổ chức và nhận lấy phần quà của mình'),
            SizedBox(height: 16.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Add QR code scanning logic here
                },
                child: Text('Quét mã nhận quà'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
