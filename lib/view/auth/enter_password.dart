import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../unit.dart';
import '../../widget/custom_text.dart';
import '../../widget/input.dart';

class EnterPasswordPage extends StatelessWidget {
  const EnterPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final kW = MediaQuery.of(context).size.width;
    final kH = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(kW * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: kH * 0.25,
              ),
              Center(
                child: CustomText(
                  text: 'Nhập mã xác thực',
                  color: pColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 19,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              CustomText(
                text: 'Mã OTP',
                color: Colors.black54,
              ),
              SizedBox(
                height: 15,
              ),
              Input(
                hintText: 'Nhập mã tại đây',
              ),
              SizedBox(
                height: 30,
              ),
              CustomText(
                text:
                    '''Lưu ý: Vui lòng không cung cấp mã này OTP cho bất kỳ ai! Nếu không thấy tin nhắn hãy thử lại sau vài phút''',
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed('/createAccount');
                },
                child: CustomText(
                  text: 'Đăng nhập',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
