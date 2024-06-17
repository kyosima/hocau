import 'package:flutter/material.dart';
import 'package:hocau/unit.dart';
import 'package:hocau/widget/custom_text.dart';

class TransactionDetailPage extends StatelessWidget {
  const TransactionDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final kW = MediaQuery.of(context).size.width;
    final kH = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
        ),
        centerTitle: true,
        title: CustomText(
          text: 'Chi tiết',
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      body: Container(
        height: kH,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.1, 0.4, 0.5, 0.9],
            colors: [
              pColor,
              Colors.green.withOpacity(0.5),
              Colors.blue.withOpacity(0.3),
              Colors.blue.withOpacity(0.05),
            ],
          ),
        ),
        child: Stack(children: [
          Container(
            margin: EdgeInsets.all(kW * 0.05),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: highLightShimmer),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.all(kW * 0.05),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/images/deposit.png'),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: 'NẠP TIỀN',
                                fontSize: 18,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              CustomText(
                                text: '+ 5.000.000 đ',
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: 'Trạng thái',
                            color: Colors.grey.shade500,
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                color: Colors.green),
                            child: CustomText(
                              text: 'Thành Công',
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: 'Thời gian',
                            color: Colors.grey.shade500,
                          ),
                          CustomText(
                            text: '10:10',
                            fontWeight: FontWeight.bold,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: 'Ngày giao dịch',
                            color: Colors.grey.shade500,
                          ),
                          CustomText(
                            text: '10/09/2024',
                            fontWeight: FontWeight.bold,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: 'Số tiền',
                            color: Colors.grey.shade500,
                          ),
                          CustomText(
                            text: '5.000.000 đ',
                            fontWeight: FontWeight.bold,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          CustomText(
                            text: 'Mã giao dịch',
                            color: Colors.grey.shade500,
                          ),
                          Spacer(),
                          CustomText(
                            text: '12388765',
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          IconButton(onPressed: () {}, icon: Icon(Icons.copy)),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: 'Loại giao dịch',
                            color: Colors.grey.shade500,
                          ),
                          CustomText(
                            text: 'Nạp tiền',
                            fontWeight: FontWeight.bold,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFC1DEFF)),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.support,
                          color: Colors.blue.shade800,
                        ),
                        CustomText(
                          text: 'Liên hệ hỗ trợ',
                          color: Colors.blue.shade800,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        )
                      ],
                    ))
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
