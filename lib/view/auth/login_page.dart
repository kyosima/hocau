import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hocau/widget/custom_text.dart';
import 'package:hocau/widget/input.dart';

import '../../unit.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

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
                  text: 'Đăng nhập',
                  color: pColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 19,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              CustomText(
                text: 'Số điện thoại',
                color: Colors.black54,
              ),
              SizedBox(
                height: 15,
              ),
              Input(
                hintText: '0335828491',
              ),
              SizedBox(
                height: 30,
              ),
              CustomText(
                text:
                    'Chúng tôi sẽ gửi mật mã dùng một lần đến tin nhắn điện thoại của bạn',
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed('/enterPassword');
                },
                child: CustomText(
                  text: 'Nhận OTP',
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
