import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hocau/unit.dart';
import 'package:hocau/view/report/popup_alert.dart';
import 'package:hocau/widget/custom_text.dart';

class BookingDetailPage extends StatelessWidget {
  String? bookingStatus;
  Color? color;
  BookingDetailPage({Key? key, this.bookingStatus, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final kW = MediaQuery.of(context).size.width;
    final kH = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
        ),
        centerTitle: true,
        title: CustomText(
          text: 'Chi tiết lịch sử đặt lịch',
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Container(
            color: Colors.grey.shade200,
            child: Padding(
              padding: EdgeInsets.all(kW * 0.05),
              child: Column(
                children: [
                  Container(
                    width: kW,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text: 'Trạng thái',
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: color,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    child: CustomText(
                                      text: bookingStatus,
                                      fontSize: 12,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text: 'Mã Đơn hàng',
                                  ),
                                  CustomText(
                                    text: '#CAUCA001',
                                    fontWeight: FontWeight.bold,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text: 'Đặt lúc',
                                  ),
                                  CustomText(
                                    text: '10:00 12/12/2024',
                                    fontWeight: FontWeight.bold,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Color(0xFFA7F3D0),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.support,
                                size: 20,
                                color: Color(0xff064E3B),
                              ),
                              CustomText(
                                text: 'Liên hệ hỗ trợ',
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff064E3B),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/hocau.png',
                          scale: 5,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: CustomText(
                            text: 'Hồ Câu Thanh Thông Thả Tỉnh Tây Ninh',
                            maxLine: 2,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: 'Chi tiết giao dịch',
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: pColor.withOpacity(0.7)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(13.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomText(
                                          text: 'Hồ câu',
                                          color: Colors.black54,
                                        ),
                                        CustomText(
                                          text: 'Hồ câu số 1',
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomText(
                                          text: 'Suất câu',
                                          color: Colors.black54,
                                        ),
                                        CustomText(
                                          text: 'Buổi sáng (7h-12h)',
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomText(
                                          text: 'Ngày câu',
                                          color: Colors.black54,
                                        ),
                                        CustomText(
                                          text: '07h00, 01/01/2024',
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomText(
                                          text: 'Giá suất',
                                          color: Colors.black54,
                                        ),
                                        CustomText(
                                          text: '344.000đ',
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomText(
                                          text: 'Ưu đãi',
                                          color: Colors.black54,
                                        ),
                                        CustomText(
                                          text: '0đ',
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomText(
                                          text: 'Tạm tính',
                                          color: Colors.black54,
                                        ),
                                        CustomText(
                                          text: '344.000đ',
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                                  return InkWell(
                                    onTap: () {},
                                    child: Container(
                                      width: 60,
                                      height: 40,
                                      margin: EdgeInsets.only(right: 15),
                                      decoration: BoxDecoration(
                                          color: index == 1
                                              ? sColor
                                              : index == 2
                                                  ? Colors.blue
                                                  : Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border:
                                              Border.all(color: Colors.grey)),
                                      child: Center(
                                        child: CustomText(
                                          text: 'A ${index + 1}',
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
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            physics: ClampingScrollPhysics(),
                            child: Row(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                          color: sColor,
                                          borderRadius:
                                              BorderRadius.circular(4)),
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
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(4)),
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
                                SizedBox(
                                  width: 20,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                          color: Colors.blue,
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    CustomText(
                                      text: 'Vị trí của bạn',
                                      fontSize: 12,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.timer_sharp,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Flexible(
                                child: CustomText(
                                  text:
                                      'Đơn hàng của bạn sẽ được giữ trong 60 phút, vui lòng thanh toán trong thời gian này.',
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  bookingStatus!.compareTo('Hoàn thành') != 0
                      ? ElevatedButton(
                          onPressed: () => Get.back(),
                          child: CustomText(
                            text: 'Thanh toán',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ))
                      : ElevatedButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) =>
                                    PopupAlert());
                          },
                          child: CustomText(
                            text: 'Đánh giá hồ câu',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
