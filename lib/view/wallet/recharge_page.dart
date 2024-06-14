import 'package:flutter/material.dart';
import 'package:hocau/view/report/money_alert.dart';
import 'package:hocau/widget/custom_text.dart';
import 'package:qr_flutter/qr_flutter.dart';

class RechargePage extends StatefulWidget {
  const RechargePage({super.key});

  @override
  State<RechargePage> createState() => _RechargePageState();
}

class _RechargePageState extends State<RechargePage> {
  @override
  Widget build(BuildContext context) {
    final kW = MediaQuery.of(context).size.width;
    final kH = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
        ),
        title: CustomText(
          text: 'Nạp tiền',
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(kW * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(border: Border.all()),
              child: QrImageView(
                data: '1234567890',
                version: QrVersions.auto,
                size: kW / 2,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            CustomText(
              text: 'THANH BITCOIN',
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            SizedBox(
              height: 10,
            ),
            CustomText(
              text: '123123123123213',
            ),
            SizedBox(
              height: 10,
            ),
            CustomText(
              text: 'Ngân hàng BIDV',
              maxLine: 2,
            ),
            SizedBox(
              height: 20,
            ),
            CustomText(
              text: 'Cú pháp chuyển tiền:',
            ),
            SizedBox(
              height: 10,
            ),
            CustomText(
              text: '(NICKNAME)(+)"NAPTIENBOOKING"',
              color: Colors.green,
              fontSize: 18,
            ),
            SizedBox(
              height: 10,
            ),
            CustomText(
              text: 'Cung cấp hình ảnh chuyển khoảng:',
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all()),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.autorenew_rounded),
                    CustomText(
                      text: 'Ảnh khác',
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return MoneyAlert('Chuyển tiền thành công',
                            'Bạn vừa thực hiện thành công lệnh nạp tiền vào tài khoản. Hệ thống sẽ xử lý trong vòng 24h.');
                      });
                },
                child: CustomText(
                  text: 'Xác nhận chuyển khoản',
                  color: Colors.white,
                ))
          ],
        ),
      ),
    );
  }
}
