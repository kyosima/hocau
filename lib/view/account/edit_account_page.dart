import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hocau/unit.dart';
import 'package:hocau/widget/custom_text.dart';
import 'package:hocau/widget/input.dart';

class EditAccountPage extends StatefulWidget {
  const EditAccountPage({super.key});

  @override
  State<EditAccountPage> createState() => _EditAccountPageState();
}

class _EditAccountPageState extends State<EditAccountPage> {
  List<String> bankList = ['BIDV', 'Agribank'];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final kW = MediaQuery.of(context).size.width;
    final kH = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: BackButton(
          color: Colors.white,
        ),
        title: CustomText(
          text: 'Chỉnh sửa thông tin cá nhân',
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: SafeArea(
          child: Container(
            color: highLightShimmer,
            child: Padding(
              padding: EdgeInsets.all(kW * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(children: [
                    Center(
                      child: CircleAvatar(
                        radius: 46,
                        backgroundColor: Color(0xffECFDF5).withOpacity(0.3),
                        child: Padding(
                          padding: const EdgeInsets.all(8), // Border radius
                          child: ClipOval(
                            child: Image.asset(
                              'assets/images/user.png',
                              width: 81,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.only(bottom: 5),
                          width: 89,
                          height: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(46)),
                            color: Colors.black.withOpacity(0.4),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.camera_alt_outlined,
                                color: Colors.white,
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ]),
                  SizedBox(
                    height: 15,
                  ),
                  CustomText(
                    text: 'Họ và tên',
                  ),
                  Input(
                    initialValue: 'Trần Quốc Khánh',
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomText(
                    text: 'Nickname',
                  ),
                  Input(
                    initialValue: 'Cần thủ đỉnh cao',
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomText(
                    text: 'Số điện thoại',
                  ),
                  Input(
                    initialValue: '0123456789',
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomText(
                    text: 'Email(Không bắt buộc)',
                  ),
                  Input(
                    initialValue: 'quockhanh@gmail.com',
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomText(
                    text: 'Ngân hàng thụ hưởng',
                  ),
                  DropdownButtonFormField(
                    hint: Text("Chọn ngân hàng thụ hưởng"),
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      filled: true,
                      contentPadding: EdgeInsets.all(kW < 450 ? 10 : 18),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: pColor,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                    ),
                    items: bankList.map((bank) {
                      return DropdownMenuItem(
                        child: new Text(bank),
                        value: bank,
                      );
                    }).toList(),
                    onChanged: (value) {},
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomText(
                    text: 'Tài khoản thụ hưởng',
                  ),
                  Input(),
                  SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: CustomText(
                        text: 'Lưu thông tin',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
