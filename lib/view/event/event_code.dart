// import 'dart:html';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hocau/widget/custom_text.dart';

import '../../unit.dart';
import '../../widget/button_account.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class EventCodePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 11, 137, 76),
          centerTitle: true,
          title: Text(
            'Mã nhận quà',
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
        body: RewardScreen(),
      ),
    );
  }
}

class RewardScreen extends StatelessWidget {
  final List<RewardItem> items = [
    RewardItem(
      'Tham gia quét mã nhận quà',
      '1 chiếc cần câu lua máy đứng SHIMANO WORLD SHAULA',
      'Mới đây',
      'assets/images/event1.png',
      'assets/images/qrcode1.png',
    ),
    RewardItem(
      'Tham gia quét mã nhận quà',
      '1 chiếc cần câu lua máy đứng SHIMANO WORLD SHAULA',
      '10 phút trước',
      'assets/images/event2.png',
      'assets/images/qrcode1.png',
    ),
    RewardItem(
      'Tham gia quét mã nhận quà',
      '1 chiếc cần câu lua máy đứng SHIMANO WORLD SHAULA',
      '30 phút trước',
      'assets/images/event3.jpg',
      'assets/images/qrcode1.png',
    ),
    RewardItem(
      'Tham gia quét mã nhận quà',
      '1 chiếc cần câu lua máy đứng SHIMANO WORLD SHAULA',
      'Hôm qua',
      'assets/images/event4.jpg',
      'assets/images/choose.png',
    ),
    RewardItem(
      'Tham gia quét mã nhận quà',
      '1 chiếc cần câu lua máy đứng SHIMANO WORLD SHAULA',
      '3 ngày trước',
      'assets/images/event5.jpg',
      'assets/images/choose.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBarWidget(),
        Expanded(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return RewardCard(item: items[index]);
            },
          ),
        ),
      ],
    );
  }
}

class RewardItem {
  final String title;
  final String subtitle;
  final String time;
  final String iconPath;
  final String qrcode;

  RewardItem(this.title, this.subtitle, this.time, this.iconPath, this.qrcode);
}

class RewardCard extends StatelessWidget {
  final RewardItem item;

  RewardCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed('/event_qrcode');
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  item.iconPath,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withOpacity(0.6),
                      Colors.black.withOpacity(0.2)
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.title,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 5),
                          Container(
                            padding: EdgeInsets.all(0),
                            child: Text(
                              item.subtitle,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white70,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines:
                                  2, // Adjust the number of lines as needed
                              softWrap: true,
                            ),
                          ),
                          SizedBox(height: 40),
                          Text(
                            item.time,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white54,
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    color: Color.fromARGB(72, 255, 255, 255),
                    padding: EdgeInsets.fromLTRB(20, 50, 20, 50),
                    child: Image.asset(
                      item.qrcode,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TabBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final kW = MediaQuery.of(context).size.width;
    final kH = MediaQuery.of(context).size.height;
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Column(
        children: [
          Container(
            height: 60,
            color: Colors.white,
            child: TabBar(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  color: Colors.black),
              indicatorPadding: EdgeInsets.fromLTRB(15, 0, 15, 4),
              indicatorWeight: 4,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: Colors.orange,
              labelColor: Colors.black,
              unselectedLabelColor: const Color.fromARGB(255, 0, 0, 0),
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.orange),
              tabs: [
                Tab(
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black, width: 1)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Mới nhất"),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black, width: 1)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Cũ nhất"),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black, width: 1)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Đã nhận"),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black, width: 1)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Chưa nhận"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
