import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../unit.dart';
import '../../widget/custom_text.dart';
import '../../widget/input.dart';
import '../../controller/event/event_controller.dart';

class EventDetailPage extends StatelessWidget {
  String dropdownValue = 'Chuẩn cần thủ';
  @override
  Widget build(BuildContext context) {
    final kW = MediaQuery.of(context).size.width;
    final kH = MediaQuery.of(context).size.height;
    final EventController eventCtrl = Get.find<EventController>();
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              "Chi tiết sự kiện",
              style: TextStyle(color: Colors.white),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.qr_code_scanner),
            ),
          ],
        ),
        body: Obx(() {
          final event = eventCtrl.selectedEvent.value;
          final switchValue = eventCtrl.switchValue.value;
          return SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // header
              Container(
                height: 205,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(event.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // information
              Container(
                height: kW < 450 ? 600 : 550,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                  child: Column(
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Thông tin sự kiện',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        readOnly: true,
                        decoration: InputDecoration(
                          hintText: event.title,
                          fillColor: Colors.black12,
                          filled: true,
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        readOnly: true,
                        decoration: InputDecoration(
                          hintText: event.location,
                          fillColor: Colors.black12,
                          filled: true,
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        height: 94,
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: TextFormField(
                          minLines: 1,
                          maxLines: 3,
                          readOnly: true,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(15),
                            hintText: event.prizes
                                .map((prize) => prize.name.toString())
                                .join(', '),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        readOnly: true,
                        decoration: InputDecoration(
                          hintText: event.price.toString(),
                          fillColor: Colors.black12,
                          filled: true,
                          suffixText: 'VNĐ',
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        readOnly: true,
                        decoration: InputDecoration(
                          hintText: event.prizes.length.toString(),
                          fillColor: Colors.black12,
                          filled: true,
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        readOnly: true,
                        decoration: InputDecoration(
                          hintText: DateFormat('dd/MM/yyyy')
                              .format(event.startDate)
                              .toString(),
                          fillColor: Colors.black12,
                          filled: true,
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.date_range),
                            onPressed: () {},
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        readOnly: true,
                        decoration: InputDecoration(
                          hintText: DateFormat('dd/MM/yyyy')
                              .format(event.endDate)
                              .toString(),
                          fillColor: Colors.black12,
                          filled: true,
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.date_range),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              // Điều kiện tham gia
              Container(
                padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                height: switchValue
                    ? 200
                    : 75, // 190-> 200 && 66 -> 75 : overflowed to the bottom
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Điều kiện tham gia',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Switch(
                          value: switchValue,
                          onChanged: (value) {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    if (switchValue) ...[
                      Row(
                        children: [
                          Icon(Icons.settings),
                          SizedBox(width: 6),
                          Text('Có điểm CCV từ',
                              style: TextStyle(fontSize: 14)),
                          SizedBox(width: 6),
                          Expanded(
                            child: TextField(
                              readOnly: true,
                              decoration: InputDecoration(
                                hintText: event.minPointsRequired.toString(),
                                hintStyle: TextStyle(fontSize: 14),
                                fillColor: Colors.black12,
                                filled: true,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 13,
                                  horizontal: 14,
                                ),
                              ),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          SizedBox(width: 6),
                          Text('trở lên', style: TextStyle(fontSize: 14)),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Icon(Icons.settings),
                          SizedBox(width: 8),
                          Text('Có xếp loại', style: TextStyle(fontSize: 14)),
                          SizedBox(width: 8),
                          Expanded(
                            child: DropdownButton<String>(
                              isExpanded: true,
                              value: dropdownValue,
                              onChanged: (String? newValue) {},
                              items: <String>[
                                'Chuẩn cần thủ'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700),
                                      textAlign: TextAlign.center),
                                );
                              }).toList(),
                            ),
                          ),
                          SizedBox(width: 6),
                          Text('trở lên', style: TextStyle(fontSize: 14)),
                        ],
                      ),
                    ]
                  ],
                ),
              ),
              const SizedBox(height: 8),

              // QR code

              Container(
                  padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  height: 75,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'QR tham gia sự kiện',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                Get.toNamed('/event_qr');
                              },
                              icon: const Icon(Icons.qr_code_2_rounded),
                            ),
                          ],
                        ),
                      ])),

              const SizedBox(height: 6),
              // button
              Column(
                children: [
                  ...buildActionButtonsStatus(event.status.name, context),
                ],
              ),
            ],
          ));
        }));
  }
}

List<Widget> buildActionButtonsStatus(event, context) {
  List<Widget> buttons = [];
  final kW = MediaQuery.of(context).size.width;
  Widget createButton(String event, VoidCallback onPressed) {
    return Padding(
        padding: EdgeInsets.fromLTRB(12, 12, 12, 6),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: getColor(event),
            ),
            onPressed: onPressed,
            child: CustomText(
              text: '${changeToVN(event)} sự kiện',
              fontWeight: FontWeight.bold,
              color: Colors.white,
            )));
  }

  Widget buttonCanceledAndFinished(VoidCallback onPressed) {
    return Padding(
        padding: EdgeInsets.fromLTRB(12, 6, 12, 12),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Color(0xffC6212C)),
            onPressed: onPressed,
            child: CustomText(
              text: 'Hủy sự kiện',
              fontWeight: FontWeight.bold,
              color: Colors.white,
            )));
  }

  switch (event) {
    case 'notStarted':
      buttons.add(createButton(event, () {}));
      break;
    case 'inProgress':
      buttons.add(createButton(event, () {}));
      //buttons.add(SizedBox(height: 8));
      buttons.add(buttonCanceledAndFinished(() {}));
      break;
    case 'paused':
      buttons.add(createButton(event, () {}));
      //buttons.add(SizedBox(height: 8));
      buttons.add(buttonCanceledAndFinished(() {}));
      break;
    case 'finished':
      buttons.add(createButton(event, () {}));
      break;
    case 'canceled':
      buttons.add(createButton(event, () {}));
      break;
  }

  return buttons;
}

Color getColor(String status) {
  switch (status) {
    case 'notStarted':
      return Color(0xff005699);
    case 'inProgress':
      return Color(0xffF98E02);
    case 'paused':
      return Color(0xff0B894C);
    default: // finished && canceled
      return Color(0xff808080);
  }
}

String changeToVN(String status) {
  switch (status) {
    case 'notStarted':
      return 'Chưa diễn ra';
    case 'inProgress':
      return 'Tạm ngưng';
    case 'paused':
      return 'Tiếp tục';
    case 'canceled':
      return 'Đã bị hủy';
    default: // finished
      return 'Đã kết thúc';
  }
}
