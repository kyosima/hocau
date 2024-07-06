import 'package:flutter/material.dart';
import 'package:hocau/unit.dart';
import 'package:hocau/widget/button_account.dart';
import 'package:hocau/widget/custom_text.dart';

class EventQrCode extends StatelessWidget {
  const EventQrCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Chi tiết sự kiện",
            style: TextStyle(color: Colors.white),
          ),
        ),
        actions: [],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 70,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'Đưa mã QR này cho người tham dự quét',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
              ),
            ),
          ),
          SizedBox(
              height: 274,
              width: double.infinity,
              child: Stack(
                children: [
                  Image.asset(
                    'assets/images/img-qr-code.png',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      height: 226,
                      width: 226,
                      child: Icon(Icons.qr_code_2_sharp, size: 194),
                    ),
                  )
                ],
              )),
          SizedBox(
            height: 88,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: pColor,
                ),
                onPressed: () {},
                child: CustomText(
                  text: 'Tải xuống mã QR',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
