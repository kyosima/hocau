import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../unit.dart';
import '../../widget/custom_text.dart';
import '../../widget/input.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

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
                height: kH * 0.2,
              ),
              Center(
                child: CustomText(
                  text: 'Chào bạn mới!',
                  color: pColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 19,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              CustomText(
                text: 'Họ và tên',
                color: Colors.black54,
              ),
              SizedBox(
                height: 10,
              ),
              Input(
                hintText: 'Nhập họ tên',
              ),
              SizedBox(
                height: 15,
              ),
              CustomText(
                text: 'Nickname',
                color: Colors.black54,
              ),
              SizedBox(
                height: 10,
              ),
              Input(
                hintText: 'Đặt nickname',
              ),
              SizedBox(
                height: 15,
              ),
              CustomText(
                text: 'Số điện thoại',
                color: Colors.black54,
              ),
              SizedBox(
                height: 10,
              ),
              Input(
                hintText: 'Nhập số điện thoại',
              ),
              SizedBox(
                height: 15,
              ),
              CustomText(
                text: 'Người giới thiệu',
                color: Colors.black54,
              ),
              SizedBox(
                height: 10,
              ),
              Input(
                hintText: 'Cần thủ huyền thoại',
                enable: false,
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed('/dashboard');
                },
                child: CustomText(
                  text: 'Tiếp tục',
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
