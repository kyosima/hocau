import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hocau/unit.dart';
import 'package:hocau/widget/custom_text.dart';

class LakeChildDetailPage extends StatefulWidget {
  const LakeChildDetailPage({super.key});

  @override
  State<LakeChildDetailPage> createState() => _LakeChildDetailPageState();
}

class _LakeChildDetailPageState extends State<LakeChildDetailPage> {
  double _currentSliderValue = 0;

  @override
  Widget build(BuildContext context) {
    final kW = Get.width;
    final kH = Get.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Hồ câu'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(kW * 0.05),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                      child: CustomText(
                    text: 'Sáng',
                  )),
                  Flexible(
                      child: CustomText(
                    text: 'Trưa',
                  )),
                  Flexible(
                      child: CustomText(
                    text: 'Chiều',
                  )),
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: Slider(
                  value: _currentSliderValue,
                  max: 3,
                  divisions: 2,
                  label: _currentSliderValue.round().toString(),
                  activeColor: pColor,
                  onChanged: (double value) {
                    setState(() {
                      _currentSliderValue = value;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
