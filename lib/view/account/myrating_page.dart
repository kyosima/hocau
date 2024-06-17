import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hocau/controller/rating/rating_controller.dart';
import 'package:hocau/unit.dart';
import 'package:hocau/widget/custom_text.dart';

class MyratingPage extends StatefulWidget {
  const MyratingPage({super.key});

  @override
  State<MyratingPage> createState() => _MyratingPageState();
}

class _MyratingPageState extends State<MyratingPage> {
  final controller = Get.put(RatingController());
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RatingController());
    final kW = MediaQuery.of(context).size.width;
    final kH = MediaQuery.of(context).size.height;
    return Obx(() => Scaffold(
          appBar: AppBar(
            leading: BackButton(
              color: Colors.white,
            ),
            centerTitle: true,
            title: CustomText(
              text: 'Xếp loại của tôi',
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
          body: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: SafeArea(
              child: Container(
                color: highLightShimmer,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 20, bottom: 20),
                      decoration: BoxDecoration(
                          color: Color(0xFF064e3b),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      width: kW,
                      child: Column(
                        children: [
                          CustomText(
                            text: 'Bạn đang là chuẩn cần thủ',
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                bottom: 40, left: 30, top: 30, right: 100),
                            decoration: new BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              image: new DecorationImage(
                                  image: new ExactAssetImage(controller
                                      .bgRating[controller.rating.value]),
                                  fit: BoxFit.fill),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: 'Tên người dùng:',
                                  fontSize: 10,
                                  color: [0, 1, 5]
                                          .contains(controller.rating.value)
                                      ? Color(0xff001F42)
                                      : Colors.white,
                                ),
                                CustomText(
                                  text: 'Nguyễn Quốc Khánh',
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: [0, 1, 5]
                                          .contains(controller.rating.value)
                                      ? Color(0xff001F42)
                                      : Colors.white,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                CustomText(
                                  text: 'Nickname:',
                                  fontSize: 10,
                                  color: [0, 1, 5]
                                          .contains(controller.rating.value)
                                      ? Color(0xff001F42)
                                      : Colors.white,
                                ),
                                CustomText(
                                  text: 'Cần thủ đỉnh cao',
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: [0, 1, 5]
                                          .contains(controller.rating.value)
                                      ? Color(0xff001F42)
                                      : Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    CustomText(
                      text: 'Điểm số của tôi',
                      fontWeight: FontWeight.bold,
                    ),
                    Padding(
                      padding: EdgeInsets.all(kW * 0.05),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Color(0xffF9FAFB),
                                border: Border.all(color: Colors.green),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text: 'Điểm CCV',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                  CustomText(
                                    text: '25',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Color(0xffF9FAFB),
                                border: Border.all(color: Colors.green),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text: 'Số trận đã câu',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                  CustomText(
                                    text: '5',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Color(0xffF9FAFB),
                                border: Border.all(color: Colors.green),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text: 'Số giải đạt được',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                  CustomText(
                                    text: '0',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Color(0xffF9FAFB),
                                border: Border.all(color: Colors.green),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text: 'Số hồ đã câu',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                  CustomText(
                                    text: '25',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Color(0xffF9FAFB),
                                border: Border.all(color: Colors.green),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text: 'Số tỉnh đã câu',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                  CustomText(
                                    text: '5',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Color(0xffF9FAFB),
                                border: Border.all(color: Colors.green),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text: 'Số lượt đánh giá cụm hồ',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                  CustomText(
                                    text: '250',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Color(0xffF9FAFB),
                                border: Border.all(color: Colors.green),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text: 'Số lượt đánh giá HCV',
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  CustomText(
                                    text: '20',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.help_outline,
                                color: Colors.grey,
                                size: 20,
                              ),
                              Flexible(
                                child: CustomText(
                                  textAlign: TextAlign.start,
                                  text:
                                      'Hệ thống sẽ xem xét nâng hạng dựa trên điểm số của bạn, hãy tích cực câu cá để được thăng hạng và mở khóa các chức năng mới bạn nhé!',
                                  fontSize: 12,
                                  maxLine: 4,
                                  color: Colors.grey,
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
            ),
          ),
        ));
  }
}
