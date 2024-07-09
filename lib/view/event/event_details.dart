import 'dart:math';

import 'package:flutter/cupertino.dart';
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/event1.png',
              width: double.infinity,
              // height: kH * 0.45,
            ),
            SizedBox(height: 15.0),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: GestureDetector(
                onTap: () {
                  Get.toNamed('/lakeDetail');
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tham gia quét mã nhận quà',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: Colors.green,
                            ),
                            Text(
                              "  Hồ câu Hoàng Hải",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        Icon(Icons.keyboard_arrow_right_outlined),
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
                          child: RichText(
                              text: TextSpan(
                                  text:
                                      '1 chiếc cần câu lua máy đứng SHIMANO WORLD SHAULA, trị giá',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                  children: <TextSpan>[
                                TextSpan(
                                    text: ' 13.000.000 đ',
                                    style: TextStyle(
                                        color: Colors.orange,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold))
                              ])),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0),
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_month_outlined,
                          color: Colors.blue,
                        ),
                        SizedBox(height: 8.0),
                        RichText(
                            text: TextSpan(
                                text: '  Mở từ',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15),
                                children: <TextSpan>[
                              TextSpan(
                                text: ' 16/06/2024',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: ' đến hết',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                              ),
                              TextSpan(
                                text: ' 30/06/2024',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ])),
                        SizedBox(height: 8.0),
                      ],
                    ),
                    SizedBox(height: 8.0),
                    Row(
                      children: [
                        Icon(
                          Icons.lock_clock_outlined,
                          color: Colors.red,
                        ),
                        RichText(
                            text: TextSpan(
                                text: '  Đã phát',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15),
                                children: <TextSpan>[
                              TextSpan(
                                  text: ' ${controller.giftsDistributed}/100',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: ' phần quà',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                  ))
                            ])),
                      ],
                    ),
                    SizedBox(height: 8.0),
                  ],
                ),
              ),
            ),
            SizedBox(height: 6.0),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Điều kiện tham gia',
                    textAlign: TextAlign.left,
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    children: [
                      Icon(
                        Icons.info_outline_rounded,
                        color: Colors.black45,
                      ),
                      SizedBox(height: 12.0),
                      RichText(
                          text: TextSpan(
                              text: '  Có điểm CCV từ',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15),
                              children: <TextSpan>[
                            TextSpan(
                              text: ' 20',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: ' trở lên',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                          ])),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    children: [
                      Icon(
                        Icons.info_outline_rounded,
                        color: Colors.black45,
                      ),
                      SizedBox(height: 12.0),
                      RichText(
                          text: TextSpan(
                              text: '  Có xếp loại',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15),
                              children: <TextSpan>[
                            TextSpan(
                              text: ' Chuẩn Cần Thủ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ])),
                      SizedBox(height: 12.0),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 6.0),
            Container(
              padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ' Cách thức tham gia',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        SizedBox(height: 12.0),
                        Container(
                          width: kW * 0.92,
                          height: 100,
                          child: Text(
                            '📍 Cần thủ đến vị trí tổ chức sự kiện và tham gia bằng cách quét mã QR sự kiện, sau đó bạn sẽ nhận được một mã nhận quà từ hệ thống, dùng mã đó đưa cho người tổ chức và nhận lấy phần quà của mình',
                            overflow: TextOverflow.visible,
                          ),
                        ),
                        SizedBox(height: 12.0),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Column(
                children: [
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.toNamed('/event_code');
                      },
                      child: Text(
                        'Quét mã nhận quà',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
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
