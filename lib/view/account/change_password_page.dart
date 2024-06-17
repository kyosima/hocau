import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:hocau/unit.dart';
import 'package:hocau/widget/custom_text.dart';
import 'package:hocau/widget/input.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  bool obscureOldPass = true;
  bool obscureNewPass = true;
  bool obscureNewPass2 = true;
  @override
  Widget build(BuildContext context) {
    final kW = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
        ),
        title: CustomText(
          text: 'Đổi mật khẩu',
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          color: highLightShimmer,
          child: Padding(
            padding: EdgeInsets.all(kW * 0.05),
            child: Column(
              children: [
                Center(
                    child: CustomText(
                  text: 'CUNG CẤP THÔNG TIN SAU ĐỂ ĐỔI MẬT KHẨU',
                  fontSize: 18,
                  maxLine: 2,
                  textAlign: TextAlign.center,
                )),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(text: 'Mật khẩu cũ', fontSize: 14),
                    SizedBox(
                      width: 50,
                    ),
                    SizedBox(
                      width: 175,
                      child: Input(
                        obscureText: obscureOldPass,
                        inputType: TextInputType.text,
                        sIcon: Icon(Icons.remove_red_eye),
                        onPressed: () {
                          setState(() {
                            obscureOldPass = !obscureOldPass;
                          });
                        },
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(text: 'Mật khẩu Mới', fontSize: 14),
                    SizedBox(
                      width: 50,
                    ),
                    SizedBox(
                      width: 175,
                      child: Input(
                        obscureText: obscureNewPass,
                        inputType: TextInputType.text,
                        sIcon: Icon(Icons.remove_red_eye),
                        onPressed: () {
                          setState(() {
                            obscureNewPass = !obscureNewPass;
                          });
                        },
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: 'Xác nhận mật khẩu mới',
                      fontSize: 14,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Flexible(
                      child: Input(
                        obscureText: obscureNewPass2,
                        inputType: TextInputType.text,
                        sIcon: Icon(Icons.remove_red_eye),
                        onPressed: () {
                          setState(() {
                            obscureNewPass2 = !obscureNewPass2;
                          });
                        },
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: CustomText(
                      text: 'Đổi mật khẩu',
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
