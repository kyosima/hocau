import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hocau/unit.dart';
import 'package:hocau/view/booking/booking_detail_page.dart';
import 'package:hocau/view/wallet/transaction_detail_page.dart';
import 'package:hocau/widget/custom_text.dart';

class CustomCard extends StatefulWidget {
  int itemCount;
  String? nameLake;
  String? paymentStatus;

  CustomCard(
      {Key? key,
      this.nameLake,
      this.paymentStatus = 'Chờ thanh toán',
      this.itemCount = 1})
      : super(key: key);

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool visible = false;

  final listStatus = [
    'Chờ thanh toán',
    'Đang câu',
    'Hoàn thành',
    'Đã Hủy',
    'Đã đặt'
  ];

  final color = [
    baseShimmer,
    Colors.blue,
    Colors.green,
    Colors.red,
    Colors.green.shade300
  ];

  @override
  Widget build(BuildContext context) {
    final kW = MediaQuery.of(context).size.width;
    final kH = MediaQuery.of(context).size.height;
    return SizedBox(
      height: kH / 3,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: widget.itemCount,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          widget.nameLake = 'CAUCA00$index';
          return SizedBox(
            child: Column(
              children: [
                index == 0
                    ? Container(
                        padding:
                            EdgeInsets.only(left: kW * 0.05, right: kW * 0.05),
                        height: 60,
                        width: kW,
                        color: Colors.blue.shade200,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: 'Tháng 4/2024',
                              fontWeight: FontWeight.bold,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  visible = !visible;
                                });
                              },
                              child: Row(
                                children: [
                                  CustomText(
                                    text: visible ? 'Rút Gọn' : 'Xem thêm',
                                  ),
                                  Icon(visible
                                      ? Icons.arrow_upward
                                      : Icons.arrow_downward)
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    : SizedBox(),
                InkWell(
                  onTap: () {
                    Get.to(BookingDetailPage(
                      bookingStatus: listStatus[index],
                      color: color[index],
                    ));
                  },
                  child: Visibility(
                    visible: visible,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  style: BorderStyle.solid,
                                  width: 10,
                                  color: Colors.grey.shade300))),
                      child: Padding(
                        padding: EdgeInsets.all(kW * 0.05),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '#${widget.nameLake}',
                                  style: TextStyle(color: Color(0xFF0B894C)),
                                ),
                                Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: color[index],
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: CustomText(
                                    text: listStatus[index],
                                    fontSize: 12,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            CustomText(
                              text:
                                  'Hồ Câu Cá Thanh Thông Thả Tỉnh Tây Ninh',
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(Icons.access_time_filled),
                                CustomText(
                                  text: 'Đặt lúc: ',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12,
                                ),
                                CustomText(
                                  text: '10:00 | 09/04/2024',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(Icons.phishing),
                                CustomText(
                                  text: 'Suất câu: ',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12,
                                ),
                                CustomText(
                                  text: 'Buổi sáng (7h - 12h)',
                                  fontSize: 12,
                                  color: Colors.black,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(Icons.calendar_month),
                                CustomText(
                                  text: 'Ngày câu: ',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12,
                                ),
                                CustomText(
                                  text: '10:00 | 10/04/2024',
                                  fontSize: 12,
                                  color: Colors.black,
                                )
                              ],
                            ),
                            Divider(
                              height: 30,
                              color: Colors.grey,
                            ),
                            ElevatedButton(
                                onPressed: () {},
                                child: CustomText(
                                  text: 'Thanh toán',
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                )),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: 10,
          );
        },
      ),
    );
  }
}

class CustomCardWallet extends StatefulWidget {
  const CustomCardWallet({super.key});

  @override
  State<CustomCardWallet> createState() => _CustomCardWalletState();
}

class _CustomCardWalletState extends State<CustomCardWallet> {
  @override
  Widget build(BuildContext context) {
    final kW = MediaQuery.of(context).size.width;
    final kH = MediaQuery.of(context).size.height;
    // TODO: implement build
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 10,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Get.to(TransactionDetailPage());
          },
          child: Container(
            color: index.isOdd ? highLightShimmer : Color(0xFFb2d6c7),
            padding: EdgeInsets.all(kW * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CustomText(
                      text: '22:07 | Thanh Toán',
                      color: Colors.grey.shade500,
                      fontSize: 17,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      size: 15,
                      Icons.circle,
                      color: index.isOdd ? Colors.red : Colors.green.shade300,
                    )
                  ],
                ),
                Row(
                  children: [
                    CustomText(
                      text: '-300.000 đ',
                      fontWeight: FontWeight.w700,
                    ),
                    Icon(Icons.arrow_forward)
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
