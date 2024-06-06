import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hocau/widget/custom_text.dart';

import '../../controller/lake/lake_child_detail_controller.dart';
import '../../unit.dart';

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
                      controller.gColor.value.withOpacity(0.3),
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
                          Icon(
                            Icons.sunny,
                            color: Color(0xffFFBA09),
                          )
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
                            text: 'Trưa',
                          )),
                          Flexible(
                              child: CustomText(
                            text: 'Chiều',
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
                          activeColor: sColor,
                          inactiveColor: Colors.grey.withOpacity(0.3),
                          onChanged: (double value) {
                            setState(() {
                              _currentSliderValue = value;
                              if (value == 4) {
                                controller.gColor.value = Color(0xffFC610A);
                              } else if (value == 0) {
                                controller.gColor.value = Color(0xffFFBA09);
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
                          CustomText(
                            text: 'Suất 4 tiếng + 1 tiếng (7h-12h)',
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
            )
          ],
        ),
      ),
    );
  }
}
