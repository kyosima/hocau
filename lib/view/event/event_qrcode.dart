import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hocau/widget/custom_text.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class EventQrcodePage extends StatelessWidget {
  const EventQrcodePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final kW = MediaQuery.of(context).size.width;
    final kH = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Quét nhận quà',
          style: TextStyle(color: Colors.white, fontSize: 20),
          textAlign: TextAlign.center,
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              alignment: Alignment.center,
              child: CustomText(
                text: 'Đưa mã QR này cho người quản lý sự kiện',
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 0),
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/images/qrbackground.jpg',
                  width: kW,
                ),
                Image.asset(
                  'assets/images/qrcode.png',
                  width: kW * 0.5,
                  height: kH * 0.5,
                  alignment: Alignment.center,
                ),
              ],
            ),
            Container(
              width: kW * 0.9,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.info_outline_rounded,
                        color: Colors.blue,
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: const Text(
                          'Không chia sẻ QR cho người khác, để tránh mất phần quà của mình',
                          overflow: TextOverflow.clip,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    children: [
                      const Icon(
                        Icons.info_outline_rounded,
                        color: Colors.blue,
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: const Text(
                          'QR nhận quà chỉ có hạn sử dụng 24h sau khi nhận, sau 24h sẽ không thể quẹt để nhận quà được nữa',
                          overflow: TextOverflow.visible,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
