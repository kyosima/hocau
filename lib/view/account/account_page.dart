import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hocau/widget/custom_text.dart';

import '../../unit.dart';
import '../../widget/button_account.dart';
import '../referral/referral_link_page.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final kW = MediaQuery.of(context).size.width;
    final kH = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                height: kH,
              ),
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    color: pColor,
                    height: kH * 0.28,
                  ),
                  Positioned(
                      right: 0,
                      bottom: 10,
                      child: Image.asset(
                        'assets/images/bg.png',
                        width: kW,
                      )),
                  Column(
                    children: [
                      CustomText(
                        text: 'Tài khoản',
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      CircleAvatar(
                        radius: 46,
                        backgroundColor: Color(0xffECFDF5).withOpacity(0.3),
                        child: Padding(
                          padding: const EdgeInsets.all(8), // Border radius
                          child: ClipOval(
                            child: Image.asset(
                              'assets/images/user.png',
                              width: 70,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: kW * 0.05,
                  right: kW * 0.05,
                  top: kH * 0.25,
                ),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xffA7F3D0),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: CustomText(
                          text: 'Cần thủ Trần Quốc Khánh',
                          fontWeight: FontWeight.bold,
                          color: pColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: kW,
                      height: kW < 450 ? 50 : 60,
                      decoration: BoxDecoration(
                          color: Color(0xff96C7FF),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Center(
                          child: CustomText(
                            text: 'Chuẩn cần thủ',
                            fontWeight: FontWeight.bold,
                            color: Color(0xff001F42),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ButtonAccount(
                      title: 'Thông tin cá nhân',
                      icon: Icons.info_outline,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ButtonAccount(
                      title: 'Xếp loại của tôi',
                      icon: Icons.star_rate_outlined,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ButtonAccount(
                      title: 'Lịch sử đặt lịch',
                      icon: Icons.history,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ButtonAccount(
                      title: 'Liên kết giới thiệu',
                      icon: Icons.link,
                      onTap: (){
                        Get.to(() => ReferralLinkPage());
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ButtonAccount(
                      title: 'Số dư',
                      icon: Icons.monetization_on_outlined,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ButtonAccount(
                      title: 'Liên hệ',
                      icon: Icons.contact_support_outlined,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ButtonAccount(
                      title: 'Đổi mật khẩu',
                      icon: Icons.password,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ButtonAccount(
                      title: 'Đăng xuất',
                      icon: Icons.logout,
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
