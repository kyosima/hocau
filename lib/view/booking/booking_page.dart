import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hocau/unit.dart';

import '../../widget/custom_text.dart';
import '../../widget/input.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final kW = Get.width;
    final kH = Get.height;
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: Input(
            icon: Icon(Icons.search),
            borderColorInput: pColor,
            hintText: 'Tìm kiếm',
            hintColor: Colors.black54,
            sIcon: Icon(Icons.sort_outlined),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: 'Bộ lọc tìm kiếm',
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
                            'assets/images/city.png',
                            width: kW * 0.12,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: 'Tỉnh / Thành phố',
                                fontWeight: FontWeight.bold,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              CustomText(
                                text: 'Mọi nơi',
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
                            'assets/images/sfish.png',
                            width: kW * 0.12,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: 'Loại cá',
                                fontWeight: FontWeight.bold,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              CustomText(
                                text: 'Mọi loại cá',
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
                            'assets/images/hcv.png',
                            width: kW * 0.12,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: 'Sắp xếp theo HCV',
                                fontWeight: FontWeight.bold,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              CustomText(
                                text: 'Không',
                                color: Colors.black54,
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ));
            },
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(kW * 0.05),
          child: ListView.builder(
              itemCount: 4,
              shrinkWrap: true,
              itemBuilder: (context, indexLake) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: Container(
                    decoration: BoxDecoration(
                        boxShadow: boxShadow,
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  'assets/images/hocau.png',
                                  width: kW * 0.27,
                                  height: kH * 0.19,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text: 'Hồ Câu Thanh Thông Thả',
                                      fontWeight: FontWeight.w600,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_on_rounded,
                                          color: pColor,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Expanded(
                                          child: CustomText(
                                            text: 'Tây Ninh',
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
                                          text: 'Đánh giá: ',
                                          color: Colors.black54,
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        CustomText(
                                          text: '4,9',
                                          color: pColor,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.orange,
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Wrap(
                                      spacing: 8.0,
                                      runSpacing: 8.0,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color: sColor.withOpacity(0.1),
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              border:
                                                  Border.all(color: sColor)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Image.asset(
                                                  'assets/images/fish.png',
                                                  width: 18,
                                                ),
                                                SizedBox(
                                                  width: 6,
                                                ),
                                                CustomText(
                                                  text: '3 hồ',
                                                  color: sColor,
                                                  fontSize: 13,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              color: sColor.withOpacity(0.1),
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              border:
                                                  Border.all(color: sColor)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Image.asset(
                                                  'assets/images/fish.png',
                                                  width: 18,
                                                ),
                                                SizedBox(
                                                  width: 6,
                                                ),
                                                CustomText(
                                                  text: 'Ăn trưa',
                                                  color: sColor,
                                                  fontSize: 13,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              color: sColor.withOpacity(0.1),
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              border:
                                                  Border.all(color: sColor)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Image.asset(
                                                  'assets/images/fish.png',
                                                  width: 18,
                                                ),
                                                SizedBox(
                                                  width: 6,
                                                ),
                                                CustomText(
                                                  text: 'Ăn tối',
                                                  color: sColor,
                                                  fontSize: 13,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              color: sColor.withOpacity(0.1),
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              border:
                                                  Border.all(color: sColor)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Image.asset(
                                                  'assets/images/fish.png',
                                                  width: 18,
                                                ),
                                                SizedBox(
                                                  width: 6,
                                                ),
                                                CustomText(
                                                  text: 'Bãi giữ xe oto',
                                                  color: sColor,
                                                  fontSize: 13,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: kH * 0.17,
                            child: ListView.separated(
                              itemCount: 4,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    Get.toNamed('/lakeChild');
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border:
                                          Border.all(color: pColor, width: 0.5),
                                      borderRadius: BorderRadius.circular(21),
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        gradient: LinearGradient(
                                            stops: [0.02, 0],
                                            colors: [pColor, Colors.white]),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(13),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CustomText(
                                              text: 'Hồ số 1 chuyên cá Chép',
                                              fontWeight: FontWeight.bold,
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Row(
                                              children: [
                                                CustomText(
                                                  text: 'Loại cá :',
                                                  color: Colors.black54,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                CustomText(
                                                  text: 'Cá chép',
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Row(
                                              children: [
                                                CustomText(
                                                  text: 'Giờ hoạt động :',
                                                  color: Colors.black54,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                CustomText(
                                                  text: '7h - 17h',
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Row(
                                              children: [
                                                CustomText(
                                                  text: 'Điểm HCV :',
                                                  color: Colors.black54,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                CustomText(
                                                  text: '99',
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return SizedBox(
                                  width: 10,
                                );
                              },
                            ),
                          ),
                          Divider(
                            height: 30,
                            color: Colors.grey,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  CustomText(
                                    text: 'Đang hoạt động',
                                    color: Colors.teal,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.call),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      CustomText(
                                        text: '9039292923',
                                        fontWeight: FontWeight.bold,
                                      )
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                width: kW * 0.3,
                                child: ElevatedButton(
                                    onPressed: () {
                                      Get.toNamed('/lakeDetail');
                                    },
                                    child: CustomText(
                                      text: 'Xem thêm',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    )),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ));
  }
}
