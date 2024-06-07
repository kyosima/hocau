import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hocau/unit.dart';
import 'package:hocau/widget/custom_text.dart';

class CheckOutPage extends StatelessWidget {
  const CheckOutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final kW = Get.width;
    final kH = Get.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Thanh toán'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(kW * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: 'Tài khoản',
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      CustomText(
                        text: 'Số dư hiện tại:',
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      CustomText(
                        text: '5.000.000 đ',
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  )
                ],
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
                    text: 'Chi tiết giao dịch',
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: pColor.withOpacity(0.7)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: kW,
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10))),
                          child: Padding(
                            padding: const EdgeInsets.all(13.0),
                            child: CustomText(
                              text: 'Thanh toán dịch vụ',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
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
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(kW * 0.05),
              child: Row(
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
                      color: Colors.grey,
                      text:
                          'Đơn hàng của bạn sẽ được giữ trong 60 phút, vui lòng thanh toán trong thời gian này.',
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(kW * 0.05),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: 'Tổng thanh toán',
                ),
                CustomText(
                  text: '344.000đ',
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.success,
                    title: 'Giao dịch thành công',
                    desc:
                        'Bạn vừa thực hiện thành công giao dịch đặt lịch câu trên app VIP Fishing, bạn có thể xem chi tiết trong lịch sử',
                    btnCancelText: 'Trang chủ',
                    btnCancelColor: Colors.teal,
                    btnOkText: 'Xem chi tiết',
                    btnOkOnPress: () {},
                    btnCancelOnPress: () {
                      Get.offAllNamed('/dashboard');
                    },
                  ).show();
                },
                child: CustomText(
                  text: 'Xác nhận',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ))
          ],
        ),
      ),
    );
  }
}
