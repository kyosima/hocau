import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hocau/unit.dart';
import 'package:hocau/widget/custom_text.dart';

class RatingLakePage extends StatefulWidget {
  const RatingLakePage({super.key});

  @override
  State<RatingLakePage> createState() => _RatingLakePageState();
}

class _RatingLakePageState extends State<RatingLakePage> {
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
          text: 'Đánh giá hồ câu',
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Container(
            height: kH,
            decoration: BoxDecoration(
                color: baseShimmer,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(kW * 0.05),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.black,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/hocau.png',
                              scale: 5,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: CustomText(
                                text: 'Hồ Câu Thanh Thông Thả Tỉnh Tây Ninh',
                                maxLine: 2,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      RatingBar.builder(
                        initialRating: 5,
                        minRating: 1,
                        direction: Axis.horizontal,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4),
                        itemBuilder: (context, index) {
                          return Icon(
                            Icons.star,
                            color: Colors.yellow.shade700,
                          );
                        },
                        onRatingUpdate: (rating) {},
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
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          hintText:
                              'Hãy chia sẽ những điều bạn thích về hồ câu này nhé!',
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              CustomText(
                                text: 'Chọn ảnh',
                                color: Colors.white,
                              ),
                            ],
                          )),
                      SizedBox(
                        height: kW * 0.05,
                      ),
                      SizedBox(
                        height: kH * 0.17,
                        child: ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {},
                                child: SizedBox(
                                  width: kH * 0.17,
                                  child: FittedBox(
                                    fit: BoxFit.fill,
                                    child: DottedBorder(
                                      borderType: BorderType.RRect,
                                      strokeWidth: 0.5,
                                      color: Colors.grey.shade700,
                                      padding: EdgeInsets.all(10),
                                      child: FaIcon(
                                        FontAwesomeIcons.mountainSun,
                                        color: baseShimmer,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                width: 20,
                              );
                            },
                            itemCount: 4),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: ElevatedButton(
            onPressed: () {},
            child: CustomText(
              text: 'Gửi đánh giá',
              color: Colors.white,
            )),
      ),
    );
  }
}
