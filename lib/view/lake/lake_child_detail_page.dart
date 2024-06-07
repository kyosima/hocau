import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hocau/unit.dart';
import 'package:hocau/widget/custom_text.dart';
import 'package:intl/intl.dart';

import '../../controller/lake/lake_child_detail_controller.dart';
import '../../widget/input.dart';

class LakeChildDetailPage extends StatefulWidget {
  const LakeChildDetailPage({super.key});

  @override
  State<LakeChildDetailPage> createState() => _LakeChildDetailPageState();
}

class _LakeChildDetailPageState extends State<LakeChildDetailPage> {
  double _currentSliderValue = 0;
  final controller = Get.put(LakeChildController());

  @override
  Widget build(BuildContext context) {
    final kW = Get.width;
    final kH = Get.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Hồ câu'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(kW * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CustomText(
                    text: 'Hồ câu số 1',
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      CustomText(
                        text: 'Loại cá : ',
                        color: Colors.black54,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: CustomText(
                          text: 'Cá chép',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      CustomText(
                        text: 'Giờ hoạt động : ',
                        color: Colors.black54,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: CustomText(
                          text: '7h - 17h',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      CustomText(
                        text: 'Lịch hoạt động : ',
                        color: Colors.black54,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: CustomText(
                          text: 'T2 - T6',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 10,
              color: Colors.grey[200],
            ),
            Obx(
              () => Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    stops: [0.1, 0.5, 0.9],
                    colors: [
                      controller.gColor.value.withOpacity(0.5),
                      controller.gColor.value.withOpacity(0.2),
                      controller.gColor.value.withOpacity(0.01),
                    ],
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(kW * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: 'Suất câu',
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                          controller.icon.value
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                              child: CustomText(
                            text: 'Sáng',
                          )),
                          Flexible(
                              child: CustomText(
                            text: 'Chiều',
                          )),
                          Flexible(
                              child: CustomText(
                            text: 'Cả ngày',
                          )),
                        ],
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Slider(
                          value: _currentSliderValue,
                          max: 8,
                          divisions: 2,
                          label: _currentSliderValue.round().toString(),
                          activeColor: controller.gColor.value,
                          inactiveColor: Colors.grey.withOpacity(0.3),
                          onChanged: (double value) {
                            setState(() {
                              _currentSliderValue = value;
                              if (value == 4) {
                                controller.gColor.value = Color(0xffFC610A);
                                controller.name.value =
                                    'Suất 4 tiếng + 1 tiếng (12h-17h)';
                                controller.icon.value = Icon(
                                  Icons.brightness_6_outlined,
                                  color: Color(0xffFC610A),
                                );
                              } else if (value == 0) {
                                controller.gColor.value = Color(0xffFFBA09);
                                controller.name.value =
                                    'Suất 4 tiếng + 1 tiếng (7h-12h)';
                                controller.icon.value = Icon(
                                  Icons.brightness_5_outlined,
                                  color: Color(0xffFFBA09),
                                );
                              } else {
                                controller.gColor.value = Color(0xff13518A);
                                controller.name.value =
                                    'Suất 8 tiếng + 2 tiếng (7h-17h)';
                                controller.icon.value = Icon(
                                  Icons.brightness_2_outlined,
                                  color: Color(0xff13518A),
                                );
                              }
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.radio_button_checked,
                            color: Colors.green,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Obx(
                            () => CustomText(
                              text: '${controller.name.value}',
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.radio_button_unchecked,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          CustomText(
                            text: 'Suất tự do',
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 10,
              color: Colors.grey[200],
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.all(kW * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'Ngày câu',
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Input(
                      labelText: 'Ngày câu',
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
            Container(
              height: 10,
              color: Colors.grey[200],
            ),
            Padding(
              padding: EdgeInsets.all(kW * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: 'Vị trí câu',
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 40,
                    child: ListView.builder(
                        itemCount: 10,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Obx(
                            () => InkWell(
                              onTap: () {
                                setState(() {
                                  controller.pickSeat(index);
                                });
                              },
                              child: Container(
                                width: 60,
                                height: 40,
                                margin: EdgeInsets.only(right: 15),
                                decoration: BoxDecoration(
                                    color: controller.pick.contains(index)
                                        ? sColor
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: controller.pick.contains(index)
                                          ? sColor
                                          : Colors.grey,
                                    )),
                                child: Center(
                                  child: CustomText(
                                    text: 'A ${index + 1}',
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Image.asset('assets/images/lake.png'),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 40,
                    child: ListView.builder(
                        itemCount: 10,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            width: 60,
                            height: 40,
                            margin: EdgeInsets.only(right: 15),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.grey,
                                )),
                            child: Center(
                              child: CustomText(
                                text: 'B ${index + 1}',
                              ),
                            ),
                          );
                        }),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                                color: sColor,
                                borderRadius: BorderRadius.circular(4)),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          CustomText(
                            text: 'Đã được đặt',
                            fontSize: 12,
                          )
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(4)),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          CustomText(
                            text: 'Còn trống',
                            fontSize: 12,
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.error_outline,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: CustomText(
                          text:
                              'Hệ thống sẽ tự chọn vị trí câu cho bạn ngay sau khi bạn đặt lịch câu trên app',
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(kW * 0.05),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: 'Suất sáng (7h-12h), 01/01/2024',
                    maxLine: 2,
                    textOverflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomText(
                    text: 'Giá : 355.000 đ',
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: kW * 0.3,
              child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed('/checkout');
                  },
                  child: CustomText(
                    text: 'Tiếp tục',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
