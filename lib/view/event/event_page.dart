import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hocau/controller/event/event_controller.dart';
import 'package:hocau/widget/custom_text.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  final EventController eventCtrl = Get.put(EventController());
  bool _isSearchExpanded = false;

  @override
  Widget build(BuildContext context) {
    final kW = MediaQuery.of(context).size.width;
    final kH = MediaQuery.of(context).size.height;
    double _lastScrollOffset = 0;
    return Scaffold(
        backgroundColor: Colors.white,
        body: NotificationListener<ScrollUpdateNotification>(
          onNotification: (scrollNotification) {
            final currentScroll = scrollNotification.metrics.pixels;
            if (currentScroll > _lastScrollOffset && currentScroll > 170) {
              // Lướt lên và vượt qua ngưỡng
              if (!_isSearchExpanded) {
                setState(() {
                  _isSearchExpanded = true;
                });
              }
            } else if (_lastScrollOffset > currentScroll &&
                _lastScrollOffset < 170) {
              // Lướt xuống
              if (_isSearchExpanded) {
                setState(() {
                  _isSearchExpanded = false;
                });
              }
            }
            _lastScrollOffset = currentScroll;
            return true;
          },
          child: CustomScrollView(
            slivers: <Widget>[
              // sliver app bar
              SliverAppBar(
                expandedHeight: 230,
                backgroundColor:
                    !_isSearchExpanded ? Colors.white : Color(0xff0B894C),
                floating: false,
                pinned: true,
                title: _isSearchExpanded
                    ? TextField(
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          hintText: 'Tìm kiếm...',
                          hintStyle: TextStyle(color: Colors.black),
                          prefixIcon:
                              const Icon(Icons.search, color: Colors.black),
                          suffixIcon: const Icon(Icons.filter_alt_outlined,
                              color: Colors.black),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              width: 1,
                              color: Color(0xffC7C5DE).withOpacity(0.05),
                            ),
                          ),
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 10.0),
                        ),
                      )
                    : const Center(
                        child: Text('Quản lý sự kiện',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ))),
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    children: [
                      //image header
                      SizedBox(
                        width: kW,
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.vertical(bottom: Radius.circular(8)),
                          child: Image.asset(
                            'assets/images/headimageevent.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // search
                      Positioned(
                        bottom: 6,
                        left: 16,
                        right: 16,
                        child: TextField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: 'Tìm kiếm...',
                            hintStyle: TextStyle(color: Colors.white),
                            prefixIcon:
                                const Icon(Icons.search, color: Colors.white54),
                            filled: true,
                            fillColor: Colors.white30,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                width: 1,
                                color: const Color(0xffD0D5DD).withOpacity(0.5),
                              ),
                            ),
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 10.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                actions: [
                  !_isSearchExpanded
                      ? IconButton(
                          icon: Icon(Icons.filter_alt_outlined),
                          onPressed: () {
                            Get.bottomSheet(Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      topLeft: Radius.circular(10))),
                              child: Padding(
                                padding: EdgeInsets.all(kW * 0.05),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomText(
                                          text: 'Bộ lọc sự kiện',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17,
                                        ),
                                        CustomText(
                                          text: 'Đặt lại',
                                          color: Colors.grey,
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      height: 20,
                                      color: Colors.black54,
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/images/location.png',
                                          width: kW * 0.12,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CustomText(
                                              text: 'Hồ tổ chức',
                                              fontWeight: FontWeight.bold,
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            CustomText(
                                              text: 'Tất cả',
                                              color: Colors.black54,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/images/status.png',
                                          width: kW * 0.12,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CustomText(
                                              text: 'Trạng thái',
                                              fontWeight: FontWeight.bold,
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            CustomText(
                                              text: 'Tất cả',
                                              color: Colors.black54,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ));
                          },
                        )
                      : Container()
                ],
              ),

              // event items
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: eventCtrl.events.length,
                  (context, index) {
                    final event = eventCtrl.events[index];
                    return InkWell(
                      onTap: () {
                        Get.toNamed('/detailEvent');
                      },
                      child: Card(
                        elevation: 0,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      event.image,
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      height: 200,
                                    ),
                                  ),
                                  Positioned(
                                    top: 0,
                                    left: 0,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          color: Colors.black45,
                                          child: Padding(
                                            padding: EdgeInsets.all(5),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Icon(
                                                  Icons.location_city_outlined,
                                                  color: Colors.white,
                                                ),
                                                SizedBox(width: 5),
                                                Text(
                                                  event.status.name,
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
                                        SizedBox(height: 5),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    child: Container(
                                      width: double.infinity,
                                      padding:
                                          EdgeInsets.fromLTRB(10, 5, 0, 10),
                                      color: Colors.black45,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Tham gia quét nhận mã',
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
                                width: double.infinity,
                                padding: EdgeInsets.all(5),
                                color: Color.fromARGB(255, 11, 137, 76),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Từ: ${event.startDate} - ${event.endDate}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 10,
                                      ),
                                    ),
                                    Text(
                                      "Đã phát: 100/1000",
                                      style: TextStyle(
                                        fontSize: 8,
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
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: SizedBox(
            height: 56,
            width: 56,
            child: FittedBox(
                child: ClipRect(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: const Color(0xFFf98E02),
                ),
                child: IconButton(
                  icon: const Icon(Icons.add),
                  color: Colors.white,
                  onPressed: () {
                    Get.toNamed('/createEvent');
                  },
                ),
              ),
            ))));
  }
}
