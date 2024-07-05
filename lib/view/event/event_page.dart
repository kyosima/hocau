import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hocau/widget/custom_text.dart';

import '../../unit.dart';
import '../../widget/button_account.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class EventPage extends StatelessWidget {
  const EventPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final kW = MediaQuery.of(context).size.width;
    final kH = MediaQuery.of(context).size.height;
    final List<Event> events = [
      Event(
        title: "Hồ câu Thanh Thong Thả - Tây Ninh",
        location: "Hồ câu Thanh Thong Thả",
        condition: "Có điều kiện",
        distribution: "10/100",
        description: "1 chiếc cần câu máy dòng SHIMANO WORLD SHAULA",
        dateRange: "16/06/2024 - 30/06/2024",
        imagePaths: [
          'assets/images/banner.png',
        ],
      ),
      Event(
        title: "Hồ câu Hoàng Hải - Thủ Đức",
        location: "Hồ câu Hoàng Hải",
        condition: "Có điều kiện",
        distribution: "10/100",
        description: "1 chiếc cần câu máy dòng SHIMANO WORLD SHAULA",
        dateRange: "16/06/2024 - 30/06/2024",
        imagePaths: [
          'assets/images/banner.png',
        ],
      ),
      Event(
        title: "Hồ câu Đại Quang Minh - HCM",
        location: "Hồ câu Quang Minh",
        condition: "Có điều kiện",
        distribution: "10/100",
        description: "1 chiếc cần câu máy dòng SHIMANO WORLD SHAULA",
        dateRange: "16/06/2024 - 30/06/2024",
        imagePaths: [
          'assets/images/banner.png',
        ],
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 11, 137, 76),
        title: const Text(
          "Sự kiện đang diễn ra",
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.airplane_ticket_outlined),
            color: Color.fromARGB(255, 255, 255, 255),
            onPressed: () {
              // Handle notificationsr
            },
          ),
          IconButton(
            icon: Icon(Icons.qr_code_outlined),
            color: Color.fromARGB(255, 255, 255, 255),
            onPressed: () {
              // Handle settings
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            padding: EdgeInsets.all(8),
            child: ImageSlideshow(
              width: kW, //double.infinity,
              height: kH,
              initialPage: 0,
              indicatorColor: Colors.deepOrange,
              indicatorRadius: 4,
              indicatorBackgroundColor: Colors.grey,
              children: [
                Image.asset(
                  'assets/images/banner.png',
                  fit: BoxFit.contain,
                ),
                Image.asset(
                  'assets/images/banner.png',
                  fit: BoxFit.contain,
                ),
                Image.asset(
                  'assets/images/banner.png',
                  fit: BoxFit.contain,
                ),
                Image.asset(
                  'assets/images/banner.png',
                  fit: BoxFit.contain,
                ),
              ],
              autoPlayInterval: 8000,
              isLoop: true,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: events.length,
              itemBuilder: (context, index) {
                return EventCard(event: events[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Event {
  final String title;
  final String location;
  final String distribution;
  final String condition;
  final String description;
  final String dateRange;
  final List<String> imagePaths;

  Event({
    required this.title,
    required this.location,
    required this.distribution,
    required this.condition,
    required this.description,
    required this.dateRange,
    required this.imagePaths,
  });
}

class EventCard extends StatelessWidget {
  final Event event;

  EventCard({required this.event});

  @override
  Widget build(BuildContext context) {
    final kW = MediaQuery.of(context).size.width;
    final kH = MediaQuery.of(context).size.height;

    return InkWell(
      onTap: () {
        Get.toNamed('/event_details');
      },
      child: Column(
        children: [
          Card(
            elevation: 0,
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.title,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        child: Image.asset(
                          event.imagePaths[0],
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 200,
                        ),
                      ),
                      Positioned(
                        top: 5,
                        left: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.black45,
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.location_on_outlined,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      event.location,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w100,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 3),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.black45,
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.settings_outlined,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      event.condition,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w100,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.fromLTRB(10, 5, 0, 10),
                          color: Colors.black54,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Tham gia quét mã nhận quà',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                event.description,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      color: Color.fromARGB(255, 11, 137, 76),
                    ),
                    width: double.infinity,
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.watch_later_outlined,
                              color: Colors.white,
                              size: 16,
                            ),
                            Text(
                              " Từ: ${event.dateRange}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Đã phát: ${event.distribution}",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
