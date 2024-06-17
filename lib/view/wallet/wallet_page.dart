import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hocau/unit.dart';
import 'package:hocau/view/wallet/recharge_page.dart';
import 'package:hocau/view/wallet/withdraw_page.dart';
import 'package:hocau/view/wallet/transaction_page.dart';
import 'package:hocau/widget/custom_card.dart';
import 'package:hocau/widget/custom_text.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

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
          text: 'Số dư của tôi',
          fontWeight: FontWeight.w600,
          fontSize: 20,
          color: Colors.white,
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            color: highLightShimmer,
            padding: EdgeInsets.all(kW * 0.05),
            child: Container(
              width: kW,
              padding: EdgeInsets.all(kW * 0.05),
              decoration: BoxDecoration(
                color: Color(0xff0B894C),
                borderRadius: BorderRadius.all(Radius.circular(10)),
                image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: new ExactAssetImage('assets/images/bgwallet.png'),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      CustomText(
                        text: 'Tổng số dư hiện tại ',
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.remove_red_eye,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      CustomText(
                        text: 'đ ',
                        color: Colors.white,
                        fontSize: 32,
                        textDecoration: TextDecoration.underline,
                        colorDecortion: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                      CustomText(
                        text: '50.000.000',
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size.fromHeight(60),
                        backgroundColor: highLightShimmer,
                      ),
                      onPressed: () {
                        Get.to(RechargePage());
                      },
                      child: CustomText(
                        text: 'Nạp tiền +',
                        color: Color(0xFF0B894C),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ))
                ],
              ),
            ),
          ),
          Container(
            color: baseShimmer,
            height: 10,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 2, color: Colors.green))),
              child: Column(
                children: [
                  Container(
                    color: highLightShimmer,
                    padding: EdgeInsets.symmetric(horizontal: kW * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: 'Giao dịch gần đây',
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        TextButton(
                            onPressed: () {
                              Get.to(TransactionPage());
                            },
                            child: CustomText(
                              text: 'Xem thêm',
                              color: Colors.green,
                            ))
                      ],
                    ),
                  ),
                  Flexible(fit: FlexFit.loose, child: CustomCardWallet()),
                ],
              ),
            ),
          ),
          Container(
            color: highLightShimmer,
            child: Container(
              padding: EdgeInsets.all(kW * 0.05),
              child: ElevatedButton(
                child: CustomText(
                  text: 'Rút tiền -',
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
                onPressed: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    isDismissible: false,
                    context: context,
                    builder: (BuildContext context) {
                      return WithdrawPage();
                    },
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
