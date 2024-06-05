import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:hocau/unit.dart';
import 'package:hocau/widget/custom_text.dart';

class LakeDetailPage extends StatelessWidget {
  const LakeDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final kW = MediaQuery.of(context).size.width;
    final kH = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Chi tiết hồ'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/hoca.png',
              width: kW,
            ),
            Container(
              decoration: BoxDecoration(),
              child: Padding(
                padding: EdgeInsets.all(kW * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'Hồ Câu Thanh Thông Thả Tỉnh Tây Ninh ',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CustomText(
                      text: 'Đang hoạt động',
                      color: Colors.teal,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Icon(Icons.call),
                        SizedBox(
                          width: 6,
                        ),
                        CustomText(
                          text: '9039292923',
                          fontWeight: FontWeight.bold,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_rounded,
                          color: pColor,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Expanded(
                          child: CustomText(
                            text: 'KP. Lộc Vĩnh/HL2 TX, Trảng Bàng, Tây Ninh',
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        CustomText(
                          text: '20+ lượt đánh giá',
                          color: Colors.black54,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        CustomText(
                          text: '(4,9)',
                          color: pColor,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.orange,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            text: 'Thông tin thêm',
                            color: Colors.grey,
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.grey,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 10,
              color: Colors.grey[200],
            ),
            Container(
              decoration: BoxDecoration(),
              child: Padding(
                padding: EdgeInsets.all(kW * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'Mô tả hồ cá',
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        'https://posapp.vn/wp-content/uploads/2022/02/ho-cau-ca.png',
                        width: kW,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CustomText(
                      text:
                          '✅ Hồ câu cá giải trí Thiên Anh là một trong những hồ câu Đài hiếm hoi do chính các cần thủ của câu ',
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 10,
              color: Colors.grey[200],
            ),
            Container(
              decoration: BoxDecoration(),
              child: Padding(
                padding: EdgeInsets.all(kW * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'Hồ câu',
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ListView.separated(
                      itemCount: 3,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Get.toNamed('/lakeChild');
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: boxShadow,
                              border: Border.all(color: pColor),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: CustomText(
                                          text: 'Hồ câu $index ',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: pColor,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8.0,
                                              right: 8,
                                              bottom: 3,
                                              top: 3),
                                          child: CustomText(
                                            text: 'Đang hoạt động',
                                            fontSize: 13,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      )
                                    ],
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
                                          text: 'Cá Chép',
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
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 15,
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 10,
              color: Colors.grey[200],
            ),
            Container(
              decoration: BoxDecoration(),
              child: Padding(
                padding: EdgeInsets.all(kW * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'Đánh giá',
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        CustomText(
                          text: '4.5/5',
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        RatingBar.builder(
                          initialRating: 4.5,
                          minRating: 0.5,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          unratedColor: Colors.grey,
                          itemSize: 24,
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {},
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ListView.separated(
                      itemCount: 3,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/images/user.png',
                                width: 50,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Flexible(
                                          child: CustomText(
                                            text: 'Trần Văn Khánh',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              gradient: gColor,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border:
                                                  Border.all(color: tColor)),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 12.0,
                                                right: 12,
                                                bottom: 2,
                                                top: 2),
                                            child: CustomText(
                                              text: 'Đặc Cấp Đài Sư',
                                              fontSize: 14,
                                              color: tColor,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    RatingBar.builder(
                                      initialRating: 4.5,
                                      minRating: 0.5,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      unratedColor: Colors.grey,
                                      itemSize: 18,
                                      itemBuilder: (context, _) => Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (rating) {},
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    CustomText(
                                      text:
                                          'Hồ cá quán xinh, rất thích hợp để thư giãn cuối tuần',
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    SizedBox(
                                      height: kH * 0.11,
                                      child: ListView.separated(
                                        itemCount: 3,
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, indexImage) {
                                          return ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: indexImage == 2
                                                ? Stack(
                                                    alignment: Alignment.center,
                                                    children: [
                                                      Image.asset(
                                                        'assets/images/hoca.png',
                                                        width: kH * 0.11,
                                                        height: kH * 0.11,
                                                        fit: BoxFit.cover,
                                                      ),
                                                      Container(
                                                        width: kH * 0.11,
                                                        height: kH * 0.11,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.grey
                                                              .withOpacity(0.4),
                                                        ),
                                                      ),
                                                      CustomText(
                                                        text: '+2',
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white,
                                                      )
                                                    ],
                                                  )
                                                : Image.asset(
                                                    'assets/images/hoca.png',
                                                    width: kH * 0.11,
                                                    fit: BoxFit.cover,
                                                  ),
                                          );
                                        },
                                        separatorBuilder: (BuildContext context,
                                            int indexImage) {
                                          return SizedBox(
                                            width: 10,
                                          );
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 15,
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
