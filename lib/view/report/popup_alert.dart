import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hocau/unit.dart';
import 'package:hocau/view/report/rating_lake_page.dart';
import 'package:hocau/widget/custom_text.dart';
import 'package:hocau/widget/input.dart';

class PopupAlert extends StatefulWidget {
  const PopupAlert({super.key});

  @override
  State<PopupAlert> createState() => _PopupAlertState();
}

bool? isUnsatisfied;

class _PopupAlertState extends State<PopupAlert> {
  @override
  void initState() {
    // TODO: implement initState
    isUnsatisfied = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final kW = MediaQuery.of(context).size.width;
    return Center(
      child: SingleChildScrollView(
        child: AlertDialog(
          actionsPadding: EdgeInsets.all(10),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.close,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              CustomText(
                text:
                    'Bạn có hài lòng với trải nghiệm câu cá ở hồ câu số 1 không ?',
                maxLine: 3,
                fontSize: 18,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w600,
              ),
              isUnsatisfied == true
                  ? Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          width: kW,
                          decoration: BoxDecoration(
                              color: Colors.redAccent.shade700,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Center(
                            child: CustomText(
                              text: 'Không hài lòng ?',
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          maxLines: 10,
                          maxLengthEnforcement: MaxLengthEnforcement.enforced,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade300),
                            ),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            hintText:
                                'Hãy cho chúng tôi biết lí do bạn chưa hài lòng ở đây nhé!',
                          ),
                        )
                      ],
                    )
                  : SizedBox(
                      height: 1,
                    )
            ],
          ),
          actions: [
            isUnsatisfied!
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: kW * 0.35,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: TextButton(
                          child: CustomText(
                            text: 'Chọn lại',
                            fontSize: 14,
                          ),
                          onPressed: () {
                            setState(() {});
                            isUnsatisfied = false;
                            // setState(() {
                            //   isUnsatisfied = false;
                            // });
                          },
                        ),
                      ),
                      Container(
                        width: kW * 0.35,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: TextButton(
                          child: CustomText(
                            text: 'Gửi phản hồi',
                            color: Colors.white,
                            fontSize: 14,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                            // setState(() {
                            //   isUnsatisfied = true;
                            // });
                          },
                        ),
                      ),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: kW * 0.35,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: TextButton(
                          child: CustomText(
                            text: 'Có',
                            color: Colors.white,
                            fontSize: 14,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                            Get.to(RatingLakePage());
                            // setState(() {
                            //   isUnsatisfied = false;
                            // });
                          },
                        ),
                      ),
                      Container(
                        width: kW * 0.35,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: TextButton(
                          child: CustomText(
                            text: 'Không',
                            color: Colors.white,
                            fontSize: 14,
                          ),
                          onPressed: () {
                            setState(() {
                              isUnsatisfied = true;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
