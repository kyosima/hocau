import 'package:auto_height_grid_view/auto_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart';
import 'package:hocau/unit.dart';
import 'package:hocau/widget/custom_text.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final kW = MediaQuery.of(context).size.width;
    final kH = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  color: pColor,
                  height: kH * 0.25,
                ),
                Positioned(
                    right: 0,
                    bottom: 10,
                    child: Image.asset(
                      'assets/images/bg.png',
                      width: kW,
                    )),
                SafeArea(
                  child: Padding(
                    padding: EdgeInsets.all(kW * 0.05),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/user.png',
                                  width: 50,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text: 'Xin chào',
                                      color: Colors.white70,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    CustomText(
                                      text: 'Trần Quốc Khánh',
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ],
                                )
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                Get.toNamed('/notification');
                              },
                              child: Icon(
                                Icons.notifications_none,
                                size: 30,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: kW < 450 ? 48 : 60,
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            style: TextStyle(fontSize: kW < 450 ? 15.5 : 20.5),
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white.withOpacity(0.2),
                                contentPadding:
                                    EdgeInsets.all(kW < 450 ? 10 : 18),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                ),
                                hintText: 'Tìm kiếm',
                                hintStyle: TextStyle(
                                  color: Colors.white70,
                                ),
                                prefixIcon: Icon(
                                  Icons.search_outlined,
                                  color: Colors.white,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: pColor,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white.withOpacity(0.6),
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                )),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(kW * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ImageSlideshow(
                    width: double.infinity,
                    height: kH * 0.21,
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
                    ],
                    autoPlayInterval: 8000,
                    isLoop: true,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: 'Hồ câu dành cho bạn',
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                      CustomText(
                        text: 'Xem tất cả',
                        fontSize: 14,
                        color: pColor,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        boxShadow: boxShadow,
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
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
                            height: kH * 0.167,
                            child: ListView.separated(
                              itemCount: 4,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Container(
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
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        boxShadow: boxShadow,
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
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
                            height: kH * 0.167,
                            child: ListView.separated(
                              itemCount: 4,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Container(
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
                  SizedBox(
                    height: 20,
                  ),
                  CustomText(
                    text: 'Tin tức',
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  AutoHeightGridView(
                    itemCount: 4,
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    physics: NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(0),
                    shrinkWrap: true,
                    builder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Get.toNamed('/blogDetail');
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              boxShadow: boxShadow,
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Image.asset('assets/images/new.png'),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text:
                                          'Những thời điểm lý tưởng nhất để đi câu cá!',
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    CustomText(
                                      text: DateFormat('dd/MM/yyyy')
                                          .format(DateTime.now()),
                                      fontSize: 13,
                                      color: Colors.black54,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
