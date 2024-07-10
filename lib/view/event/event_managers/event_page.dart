import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hocau/controller/event/event_controller.dart';
import 'package:hocau/widget/custom_dialog.dart';
import 'package:hocau/widget/custom_text.dart';
import 'package:intl/intl.dart';

import '../../../unit.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  final EventController eventCtrl = Get.put(EventController());
  bool _isSearchExpanded = false;
  double _lastScrollOffset = 0;

  @override
  Widget build(BuildContext context) {
    final kW = MediaQuery.of(context).size.width;
    final kH = MediaQuery.of(context).size.height;

    return Scaffold(
        body: NotificationListener<ScrollUpdateNotification>(
          onNotification: (scrollNotification) {
            final currentScroll = scrollNotification.metrics.pixels;
            if (currentScroll > _lastScrollOffset && currentScroll > 100) {
              // Lướt lên và vượt qua ngưỡng
              if (!_isSearchExpanded) {
                setState(() {
                  _isSearchExpanded = true;
                });
              }
            } else if (_lastScrollOffset > currentScroll &&
                _lastScrollOffset < 150) {
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
              SliverAppBar(
                expandedHeight: 230,
                backgroundColor:
                    !_isSearchExpanded ? Colors.white : const Color(0xff0B894C),
                floating: false,
                pinned: true,
                title: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 1000),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return FadeTransition(opacity: animation, child: child);
                  },
                  child: _isSearchExpanded
                      ? TextField(
                          key: ValueKey<bool>(_isSearchExpanded),
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            hintText: 'Tìm kiếm...',
                            hintStyle: const TextStyle(color: Colors.black),
                            prefixIcon:
                                const Icon(Icons.search, color: Colors.black),
                            suffixIcon: IconButton(
                              icon: Icon(Icons.filter_alt_outlined,
                                  color: Colors.black),
                              onPressed: () {
                                _showEventFilterBottomSheet(kW);
                              },
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 10.0),
                          ),
                        )
                      : Center(
                          key: ValueKey<bool>(_isSearchExpanded),
                          child: const Text('Quản lý sự kiện',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              )),
                        ),
                ),
                flexibleSpace: FlexibleSpaceBar(
                  title: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                      return FadeTransition(opacity: animation, child: child);
                    },
                    child: !_isSearchExpanded
                        ? Stack(
                            children: [
                              _headerImage(kW),
                              Positioned(
                                bottom: 30,
                                right: 10,
                                child: Container(
                                  height: 34,
                                  width: kW < 450 ? 245 : 315,
                                  padding: EdgeInsets.only(left: 4),
                                  child: TextField(
                                    style: const TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      hintText: 'Tìm kiếm...',
                                      hintStyle: const TextStyle(
                                          color: Colors.white, fontSize: 12),
                                      prefixIcon: const Icon(Icons.search,
                                          color: Colors.white, size: 16),
                                      filled: true,
                                      fillColor: Colors.white30,
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      contentPadding: EdgeInsets.all(4),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : null,
                  ),
                  centerTitle: true,
                ),
                actions: [
                  !_isSearchExpanded
                      ? IconButton(
                          icon: const Icon(Icons.filter_alt_outlined),
                          onPressed: () {
                            _showEventFilterBottomSheet(kW);
                          },
                        )
                      : Container(),
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
                        eventCtrl.selectEvent(event);
                        Get.toNamed('/detailEvent');
                      },
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        margin: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                        child: Padding(
                          padding: const EdgeInsets.all(0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  _imageEventCard(event.image),
                                  Positioned(
                                    top: 0,
                                    left: 0,
                                    right: 0,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            _headerStatusEventCard(
                                                event.status.name),
                                            Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 6, 6, 0),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: _buildActionButtons(
                                                    event.status.name, context),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  _bodyEventCard(event.description),
                                ],
                              ),
                              _footerEventCard(
                                  event.status.name,
                                  event.startDate,
                                  event.endDate,
                                  event.ticket,
                                  event.totalTicket),
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
        floatingActionButton: _floatingActionButton());
  }
}

Widget _headerImage(double kW) {
  return SizedBox(
    width: kW,
    child: ClipRRect(
      borderRadius: const BorderRadius.vertical(bottom: Radius.circular(8)),
      child: Image.asset(
        'assets/images/headimageevent.png',
        fit: BoxFit.cover,
      ),
    ),
  );
}

Widget _imageEventCard(String event) {
  return SizedBox(
      height: 200,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
        child: Image.asset(
          event,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ));
}

Widget _headerStatusEventCard(String event) {
  return Container(
    height: 21,
    width: 96,
    margin: EdgeInsets.fromLTRB(6, 6, 0, 0),
    decoration: BoxDecoration(
      color: Colors.black.withOpacity(0.25),
      borderRadius: const BorderRadius.all(Radius.circular(16)),
    ),
    child: Padding(
      padding: EdgeInsets.only(left: 4, top: 4, bottom: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Icons.circle,
            size: 12,
            color: _getColorStatus(event),
          ),
          const SizedBox(width: 4),
          Text(
            _changeLangugeToVN(event),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _bodyEventCard(String event) {
  return Positioned(
    bottom: 0,
    left: 0,
    right: 0,
    child: Container(
      width: double.infinity,
      height: 87,
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
      color: Colors.black.withOpacity(0.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Tham gia quét nhận mã quà',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            event,
            overflow: TextOverflow.clip,
            maxLines: 3,
            style: const TextStyle(
                color: Colors.white, fontSize: 12, fontWeight: FontWeight.w300),
          ),
        ],
      ),
    ),
  );
}

Widget _footerEventCard(String status, DateTime startDate, DateTime endDate,
    int ticket, int totalTicket) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(5),
    decoration: BoxDecoration(
        color: _getColorStatus(status),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(8))),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(children: [
          const Icon(Icons.lock_clock, color: Colors.white),
          Text(
            "Từ: ${DateFormat('dd/MM/yyyy').format(startDate)} - ${DateFormat('dd/MM/yyyy').format(endDate)}",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 10,
            ),
          ),
        ]),
        Text(
          "Đã phát: $ticket / $totalTicket",
          style: const TextStyle(
            fontSize: 10,
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}

Widget _floatingActionButton() {
  return SizedBox(
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
      )));
}

List<Widget> _buildActionButtons(String event, BuildContext context) {
  List<Widget> buttons = [];

  Widget createButton(IconData icon, VoidCallback onPressed) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.25),
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      child: IconButton(
        padding: EdgeInsets.all(4),
        icon: Icon(icon, color: Colors.white),
        onPressed: onPressed,
      ),
    );
  }

  switch (event) {
    case 'notStarted':
      buttons.add(createButton(Icons.edit, () {}));
      break;
    case 'inProgress':
      buttons.add(createButton(Icons.pause, () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomDialog(
              icon: Icons.warning,
              title: "Tạm ngưng sự kiện",
              content:
                  "Tạm ngưng sự kiện sẽ làm các chức năng liên quan tạm ngưng, hãy cân nhắc kỹ trước khi tiếp tục",
              cancelButtonText: "Quay lại",
              confirmButtonText: "Tạm ngưng sự kiện",
              onCancel: () {},
              onConfirm: () {},
            );
          },
        );
      }));
      buttons.add(const SizedBox(width: 6));
      buttons.add(createButton(Icons.delete, () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomDialog(
              icon: Icons.delete_outline,
              title: "Hủy sự kiện",
              content:
                  "Hủy sự kiện sẽ làm các chức năng liên quan bị vô hiệu, hành động này không thể hoàn tác nên hãy cân nhắc",
              cancelButtonText: "Quay lại",
              confirmButtonText: "Hủy sự kiện",
              onCancel: () {},
              onConfirm: () {},
            );
          },
        );
      }));
      break;
    case 'paused':
      buttons.add(createButton(Icons.play_circle, () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomDialog(
              icon: Icons.play_arrow_rounded,
              title: "Tiếp tục sự kiện",
              content: "Bạn có muốn tiếp tục sự kiện này",
              cancelButtonText: "Quay lại",
              confirmButtonText: "Tiếp tục sự kiện",
              onCancel: () {},
              onConfirm: () {},
            );
          },
        );
      }));
      buttons.add(const SizedBox(width: 6));
      buttons.add(createButton(Icons.delete, () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomDialog(
              icon: Icons.delete_outline,
              title: "Hủy sự kiện",
              content:
                  "Hủy sự kiện sẽ làm các chức năng liên quan bị vô hiệu, hành động này không thể hoàn tác nên hãy cân nhắc",
              cancelButtonText: "Quay lại",
              confirmButtonText: "Hủy sự kiện",
              onCancel: () {},
              onConfirm: () {},
            );
          },
        );
      }));
      break;
  }

  return buttons;
}

void _showEventFilterBottomSheet(double kW) {
  Get.bottomSheet(
    Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          topLeft: Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(kW * 0.05),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            const Divider(height: 20, color: Colors.black54),
            _buildFilterOption(
              'assets/images/location.png',
              'Hồ tổ chức',
              'Tất cả',
              kW,
              () => _showNewBottomSheetLake(kW),
            ),
            const SizedBox(height: 20),
            _buildFilterOption(
              'assets/images/status.png',
              'Trạng thái',
              'Tất cả',
              kW,
              () => _showNewBottomSheetStatus(kW),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    ),
  );
}

Widget _buildFilterOption(String imagePath, String title, String subtitle,
    double kW, VoidCallback onTap) {
  return InkWell(
    onTap: onTap,
    child: Row(
      children: [
        Image.asset(imagePath, width: kW * 0.12),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(text: title, fontWeight: FontWeight.bold),
            const SizedBox(height: 8),
            CustomText(text: subtitle, color: Colors.black54),
          ],
        ),
      ],
    ),
  );
}

void _showNewBottomSheetLake(double kW) {
  final List<String> lakesList = [
    'Lake Tahoe',
    'Crater Lake',
    'Lake Superior',
    'Lake Victoria',
    'Lake Baikal',
    'Lake Tahoe',
    'Crater Lake',
    'Lake Superior',
    'Lake Victoria',
    'Lake Baikal'
  ];

  Get.bottomSheet(
    Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          topLeft: Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(kW * 0.02),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                    SizedBox(width: 20),
                    Text(
                      'Hồ tổ chức',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text('Đặt lại', style: TextStyle(fontSize: 14)),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                )
              ],
            ),
            const Divider(height: 20, color: Colors.black54),
            Expanded(
              child: ListView.builder(
                itemCount: lakesList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      lakesList[index],
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.radio_button_off),
                      onPressed: () {},
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

void _showNewBottomSheetStatus(double kW) {
  final List<String> lakesList = [
    'Chưa bắt đầu',
    'Đang diễn ra',
    'Kết thúc',
    'Tạm ngưng',
    'Đã Hủy',
    'Đã kết thúc',
  ];

  Get.bottomSheet(
    Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          topLeft: Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(kW * 0.02),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                    SizedBox(width: 20),
                    Text(
                      'Trạng thái',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text('Đặt lại', style: TextStyle(fontSize: 14)),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                )
              ],
            ),
            const Divider(height: 20, color: Colors.black54),
            Expanded(
              child: ListView.builder(
                itemCount: lakesList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      lakesList[index],
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.radio_button_off),
                      onPressed: () {},
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Color _getColorStatus(String status) {
  switch (status) {
    case 'notStarted':
      return const Color(0xff005699);
    case 'inProgress':
      return pColor;
    case 'paused':
      return const Color(0xffF98E02);
    case 'canceled':
      return const Color(0xffC6212C);
    default: // finished
      return const Color(0xff808080);
  }
}

String _changeLangugeToVN(String status) {
  switch (status) {
    case 'notStarted':
      return 'Chưa diễn ra';
    case 'inProgress':
      return 'Đang diễn ra';
    case 'paused':
      return 'Tạm ngưng';
    case 'canceled':
      return 'Đã bị hủy';
    default: // finished
      return 'Đã kết thúc';
  }
}
