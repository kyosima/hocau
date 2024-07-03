import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../widget/custom_text.dart';
import '../../widget/input.dart';
import '../../controller/event/event_controller.dart';

class EventDetailPage extends StatefulWidget {
  @override
  State<EventDetailPage> createState() => _EventDetailPageState();
}

class _EventDetailPageState extends State<EventDetailPage> {
  final EventController eventDetails = Get.find();

  bool switchValue = false;
  String dropdownValue = 'Chuẩn cần thủ';

  @override
  Widget build(BuildContext context) {
    final kW = MediaQuery.of(context).size.width;
    final kH = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Tạo sự kiện",
            style: TextStyle(color: Colors.white),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.qr_code),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // header
            SizedBox(
              child: Stack(
                children: [
                  Container(
                    height: 205,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/headimageevent.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: (205 - 50) / 2,
                    left: (MediaQuery.of(context).size.width - 50) / 2,
                    child: GestureDetector(
                      onTap: () => Get.snackbar(
                          "Upload Image Header", "Tải hình ảnh ",
                          colorText: Colors.white),
                      child: Image.asset(
                        'assets/images/upload.png',
                        width: 60,
                        height: 60,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // information
            Container(
              height: 550,
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
                    Align(
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
                      decoration: const InputDecoration(
                        labelText: 'Tiêu đề sự kiện',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Địa điểm tổ chức',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Tên phần quà',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Giá trị phần quà',
                        suffixText: 'VNĐ',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 94,
                      child: TextFormField(
                        minLines: 1,
                        decoration: const InputDecoration(
                          labelText: '   Số lượng phần quà (không bắt buộc)',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(vertical: 32),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Input(
                      labelText: 'Ngày bắt đầu',
                      hintText:
                          '${DateFormat('dd/MM/yyyy').format(DateTime.now())}',
                      onPressed: () {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2025),
                        );
                      },
                      sIcon: Icon(Icons.date_range),
                    ),
                    const SizedBox(height: 12),
                    Input(
                      labelText: 'Ngày kết thúc',
                      hintText:
                          '${DateFormat('dd/MM/yyyy').format(DateTime.now())}',
                      onPressed: () {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2025),
                        );
                      },
                      sIcon: Icon(Icons.date_range),
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
                  : 70, // 190-> 200 && 66 -> 70 : overflowed to the bottom
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
                        onChanged: (value) {
                          setState(() {
                            switchValue = value;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  if (switchValue) ...[
                    Row(
                      children: const [
                        Icon(Icons.settings),
                        SizedBox(width: 6),
                        Text('Có điểm CCV từ', style: TextStyle(fontSize: 16)),
                        SizedBox(width: 6),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 0,
                                horizontal: 8,
                              ),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        SizedBox(width: 6),
                        Text('trở lên', style: TextStyle(fontSize: 16)),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Icon(Icons.settings),
                        SizedBox(width: 8),
                        Text('Có xếp loại', style: TextStyle(fontSize: 16)),
                        SizedBox(width: 8),
                        Expanded(
                          child: DropdownButton<String>(
                            isExpanded: true,
                            value: dropdownValue,
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue = newValue!;
                              });
                            },
                            items: <String>[
                              'Chuẩn cần thủ',
                              'Option 2',
                              'Option 3'
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                        SizedBox(width: 6),
                        Text('trở lên', style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ]
                ],
              ),
            ),
            const SizedBox(height: 8),
            // button create
            SizedBox(
                height: 64, // bo height thi luc scroll nhin k dc dep
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: ElevatedButton(
                    onPressed: () {
                      Get.snackbar(
                        "Tạo sự kiện mới",
                        "Thành công hay không chả liên quan",
                        colorText: Colors.white,
                      );
                    },
                    child: CustomText(
                      text: 'Khởi tạo',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
