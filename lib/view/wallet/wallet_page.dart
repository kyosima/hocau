import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hocau/unit.dart';
import 'package:hocau/view/wallet/recharge_page.dart';
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
          fontWeight: FontWeight.bold,
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
                borderRadius: BorderRadius.all(Radius.circular(10)),
                image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: new ExactAssetImage('assets/images/bg2.png'),
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
                        fontSize: 20,
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
                  CustomText(
                    text: '@ 50.000.000',
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size.fromHeight(60),
                        backgroundColor: highLightShimmer,
                      ),
                      onPressed: () {},
                      child: CustomText(
                        text: 'Nạp tiền +',
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
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
                ),
                onPressed: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    isDismissible: false,
                    context: context,
                    builder: (BuildContext context) {
                      return RechargePage();
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
