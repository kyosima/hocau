import 'dart:math';
import 'dart:ui';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:hocau/controller/event/event_controller.dart';
import 'package:hocau/view/event/event_managers/notification_handler.dart';
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
  late double minExtent;
  late double maxExtent;

  final ScrollController scrollController = ScrollController();
  final EventController eventCtrl = Get.put(EventController());
  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    minExtent = kToolbarHeight + MediaQuery.of(context).padding.top;
    maxExtent = 230;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: AppBarScrollHandler(
        minExtent: minExtent,
        maxExtent: maxExtent,
        controller: scrollController,
        child: CustomScrollView(
          controller: scrollController,
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate: SliverAppBarDelegate(
                minExtent: minExtent,
                maxExtent: maxExtent,
              ),
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
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                            _footerEventCard(event.status.name, event.startDate,
                                event.endDate, event.ticket, event.totalTicket),
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
      floatingActionButton: _floatingActionButton(),
    );
  }
}

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  const SliverAppBarDelegate({
    required this.minExtent,
    required this.maxExtent,
  });

  @override
  final double minExtent;
  @override
  final double maxExtent;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return minExtent != oldDelegate.minExtent ||
        maxExtent != oldDelegate.maxExtent;
  }

  @override
  OverScrollHeaderStretchConfiguration? get stretchConfiguration =>
      OverScrollHeaderStretchConfiguration();

  double get deltaExtent => maxExtent - minExtent;

  static const imgBgr = ClipRRect(
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(8.0),
      bottomRight: Radius.circular(8.0),
    ),
    child: Image(
      image: AssetImage('assets/images/headimageevent.png'),
      fit: BoxFit.cover,
    ),
  );

  double transform(double begin, double end, double t, [double x = 1]) {
    return Tween<double>(begin: begin, end: end)
        .transform(x == 1 ? t : min(1.0, t * x));
  }

  Color transformColor(Color? begin, Color? end, double t, [double x = 1]) {
    return ColorTween(begin: begin, end: end)
            .transform(x == 1 ? t : min(1.0, t * x)) ??
        Colors.transparent;
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final currentExtent = max(minExtent, maxExtent - shrinkOffset);
    double t =
        clampDouble(1.0 - (currentExtent - minExtent) / deltaExtent, 0, 1);
    CollapsingNotification(t).dispatch(context);
    final kW = MediaQuery.of(context).size.width;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final List<Widget> children = <Widget>[];
            final splashColoredBox =
                ColoredBox(color: transformColor(null, Colors.white, t, 3));

            double imgBgrHeight = maxExtent;

            if (constraints.maxHeight > imgBgrHeight) {
              imgBgrHeight = constraints.maxHeight;
            }
            children
              ..add(Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: imgBgrHeight,
                child: imgBgr,
              ))
              ..add(Positioned(
                bottom: 0,
                width: constraints.maxWidth,
                height: deltaExtent,
                child: splashColoredBox,
              ));

            const double cardPadding = 60;
            const double cardMarginHorizontal = 20;
            const double tapTargetSize = kMinInteractiveDimension;
            // appBar
            const appBarPadding = SizedBox(width: 8);
            final appBarContentWidth =
                constraints.maxWidth - (appBarPadding.width! * 4);
            const totalIconImgButtonSize = tapTargetSize * 7;
            final appBarSpace = SizedBox(
                width: (appBarContentWidth - totalIconImgButtonSize) / 6);
            children.add(Positioned(
              left: 0,
              top: 0,
              right: 0,
              child: Container(
                height: minExtent,
                color: transformColor(null, const Color(0xff0B894C), t, 2),
                child: SafeArea(
                  bottom: false,
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {},
                      ),
                      const Spacer(),
                      const Text('Quản lý sự kiện',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600)),
                      appBarSpace,
                      const Spacer(),
                      appBarSpace,
                      IconButton(
                        icon: const Icon(Icons.filter_alt_outlined,
                            color: Colors.white),
                        onPressed: () {
                          _showEventFilterBottomSheet(kW);
                        },
                      ),
                      appBarPadding,
                    ],
                  ),
                ),
              ),
            ));
            // search
            final double cardWidth =
                constraints.maxWidth - (cardMarginHorizontal * 5);
            final cardSpace = (cardWidth - (tapTargetSize * 4)) / 5;
            final Color expandedTextColor = Colors.black;
            final Color collapsedTextColor = Colors.white;
            final Color expandedbgr = const Color(0xffD0D5DD).withOpacity(0.5);
            Color textColor =
                transformColor(collapsedTextColor, expandedTextColor, t);
            Color bgColor = transformColor(expandedbgr, collapsedTextColor, t);
            children.add(Positioned(
                left: transform(
                    cardSpace + cardPadding - 60,
                    appBarPadding.width! + tapTargetSize + appBarSpace.width!,
                    t,
                    2),
                right: transform(
                    cardSpace + cardPadding - 60, appBarPadding.width!, t, 2),
                top: constraints.maxHeight > maxExtent
                    ? null
                    : transform(minExtent + cardPadding,
                        minExtent - tapTargetSize - 4, t, 2),
                bottom: constraints.maxHeight < maxExtent
                    ? null
                    : deltaExtent - tapTargetSize - cardPadding,
                child: TextField(
                  style: TextStyle(color: textColor),
                  decoration: InputDecoration(
                    hintText: 'Tìm kiếm...',
                    hintStyle: TextStyle(color: textColor),
                    prefixIcon: Icon(Icons.search, color: textColor),
                    suffixIcon: constraints.maxHeight < maxExtent
                        ? IconButton(
                            icon: Icon(Icons.filter_alt_outlined,
                                color: textColor),
                            onPressed: () {
                              _showEventFilterBottomSheet(kW);
                            },
                          )
                        : null,
                    filled: true,
                    fillColor: bgColor,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                  ),
                )));

            return Stack(children: children);
          },
        ),
      ],
    );
  }
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
      buttons.add(createButton(Icons.edit, () {
      }));
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

  int selectedLakeIndex = -1; // Biến theo dõi chỉ số của ListTile được chọn

  void resetSelection() {
    selectedLakeIndex = -1; // Đặt lại lựa chọn
  }

  Get.bottomSheet(
    StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) => Container(
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
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        resetSelection();
                      });
                    },
                    child: Row(
                      children: [
                        Text('Đặt lại', style: TextStyle(fontSize: 14)),
                        SizedBox(width: 10),
                      ],
                    ),
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
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          selectedLakeIndex == index
                              ? Icons.radio_button_checked
                              : Icons.radio_button_off,
                          color:
                              selectedLakeIndex == index ? Colors.blue : null,
                        ),
                        onPressed: () {
                          setState(() {
                            selectedLakeIndex = index;
                          });
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

void _showNewBottomSheetStatus(double kW) {
  final List<String> statussList = [
    'Chưa bắt đầu',
    'Đang diễn ra',
    'Kết thúc',
    'Tạm ngưng',
    'Đã Hủy',
    'Đã kết thúc',
  ];
  int selectedStatusIndex = -1; // Biến theo dõi chỉ số của ListTile được chọn

  void resetSelection() {
    selectedStatusIndex = -1; // Đặt lại lựa chọn
  }

  Get.bottomSheet(
    StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) => Container(
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
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        resetSelection();
                      });
                    },
                    child: Row(
                      children: [
                        Text('Đặt lại', style: TextStyle(fontSize: 14)),
                        SizedBox(width: 10),
                      ],
                    ),
                  )
                ],
              ),
              const Divider(height: 20, color: Colors.black54),
              Expanded(
                child: ListView.builder(
                  itemCount: statussList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        statussList[index],
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          selectedStatusIndex == index
                              ? Icons.radio_button_checked
                              : Icons.radio_button_off,
                          color:
                              selectedStatusIndex == index ? Colors.blue : null,
                        ),
                        onPressed: () {
                          setState(() {
                            selectedStatusIndex = index;
                          });
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
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
