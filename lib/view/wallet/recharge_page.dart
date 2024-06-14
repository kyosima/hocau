import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hocau/unit.dart';
import 'package:hocau/view/report/popup_alert.dart';
import 'package:hocau/widget/custom_text.dart';
import 'package:hocau/widget/input.dart';

class RechargePage extends StatefulWidget {
  const RechargePage({super.key});

  @override
  State<RechargePage> createState() => _RechargePageState();
}

enum BestTutorSite { cafedev, w3schools, tutorialandexample }

class _RechargePageState extends State<RechargePage> {
  List<String> bankList = ['BIDV', 'Agribank'];
  int isSelected = 1;
  bool enableInput = true;
  @override
  Widget build(BuildContext context) {
    final kW = MediaQuery.of(context).size.width;
    final kH = MediaQuery.of(context).size.height;

    return Container(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      color: highLightShimmer,
      child: Padding(
        padding: EdgeInsets.all(kW * 0.05),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              child: Center(
                child: CustomText(
                  text: 'Bạn muốn rút bao nhiêu tiền?',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  maxLine: 2,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              child: Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: [
                    TextSpan(
                        text: 'Yêu cầu rút tiền sẽ được ',
                        style: TextStyle(color: Colors.grey, fontSize: 14)),
                    TextSpan(
                        text: 'gửi lên hệ thống ',
                        style: TextStyle(
                            color: Colors.orange, fontWeight: FontWeight.bold)),
                    TextSpan(
                        text:
                            'và về tài khoản ngân hàng liên kết của bạn',
                        style: TextStyle(color: Colors.grey, fontSize: 14)),
                  ]),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Flexible(
                child: Input(
              inputType: TextInputType.number,
              autofocus: true,
              hintText: 'Nhập số tiền muốn rút',
              enable: enableInput,
            )),
            SizedBox(
              height: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ListTile(
                  title: CustomText(
                    text: 'BIDV\n1234567890',
                    fontWeight: FontWeight.bold,
                  ),
                  leading: Radio(
                    activeColor: Colors
                        .green, // Change the active radio button color here
                    fillColor: WidgetStateProperty.all(
                        Colors.green), // Change the fill color when selected
                    splashRadius: 20,
                    value: 1,
                    groupValue: isSelected,
                    onChanged: (value) {
                      setState(() {
                        isSelected = value!;
                        enableInput = true;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: CustomText(
                    text: 'Ngân hàng khác',
                    fontWeight: FontWeight.bold,
                  ),
                  leading: Radio(
                    activeColor: Colors
                        .green, // Change the active radio button color here
                    fillColor: WidgetStateProperty.all(
                        Colors.green), // Change the fill color when selected
                    splashRadius: 20,
                    value: 2,
                    groupValue: isSelected,
                    onChanged: (value) {
                      setState(() {
                        isSelected = value!;
                        enableInput = false;
                      });
                    },
                  ),
                ),
              ],
            ),
            isSelected == 2
                ? Flexible(
                    child: Input(
                    inputType: TextInputType.number,
                    hintText: 'Nhập số tài khoản',
                    enable: true,
                  ))
                : SizedBox(),
            SizedBox(
              height: 10,
            ),
            if (isSelected == 2)
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
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.verified_outlined),
                              CustomText(
                                text: 'Yêu cầu rút tiền thành công',
                                fontWeight: FontWeight.bold,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              CustomText(
                                textAlign: TextAlign.center,
                                text:
                                    'Bạn vừa thực hiện thành công lệnh rút tiền về ngân hàng thụ hưởng. Hệ thông sẽ xử lý trong vòng 24h.',
                                fontWeight: FontWeight.bold,
                                maxLine: 5,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                          actions: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  child: CustomText(
                                    text: 'Quay lại',
                                    color: Colors.blue,
                                    fontSize: 12,
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                TextButton(
                                  child: CustomText(
                                    text: 'Xem chi tiết',
                                    color: Colors.blue,
                                    fontSize: 12,
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            )
                          ],
                        );
                      });
                },
                child: CustomText(
                  text: 'Đồng ý rút tiền',
                  color: Colors.white,
                ))
          ],
        ),
      ),
    );
  }
}
