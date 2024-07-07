import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widget/custom_text.dart';

class EventLinkPage extends StatelessWidget {
  const EventLinkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              "Liên kết giới thiệu",
              style: TextStyle(color: Colors.white),
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(61.0),
            child: Container(
              color: Colors.white,
              child: const TabBar(
                tabs: [
                  Tab(text: 'Liên kết giới thiệu'),
                  Tab(text: 'Được giới thiệu'),
                ],
                labelStyle:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                unselectedLabelStyle:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                labelColor: Color(0xff0B696C),
                unselectedLabelColor: Color(0xff606060),
                indicatorSize: TabBarIndicatorSize.tab,
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            _buildEvenLinkIntroduce(),
            _buildEvenLinkIntroducedContent(),
          ],
        ),
      ),
    );
  }
}

class _buildEvenLinkIntroduce extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final kW = MediaQuery.of(context).size.width;
    final kH = MediaQuery.of(context).size.height;
    return Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textStylesCus('Liên kết giới thiệu'),
                SizedBox(height: 5),
                Text(
                    'Bạn có thể sử dụng link này để giới thiệu dịch vụ cho người thân, bạn bè,... Khi bạn giới thiệu thành công sẽ nhận được hoa hồng')
              ],
            ),
            paddingCus(kW),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                textStylesCus('Link của bạn'),
                SizedBox(height: 5),
                Text(
                  'https://shorten.asia/Abcxyz123',
                  style: TextStyle(color: Color(0xff606060)),
                )
              ]),
              Icon(Icons.copy)
            ]),
            paddingCus(kW),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                textStylesCus('Mã giới thiệu của bạn'),
                SizedBox(height: 5),
                Text('CT00123666', style: TextStyle(color: Color(0xff606060)))
              ]),
              Icon(Icons.qr_code_2_rounded)
            ]),
            paddingCus(kW),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textStylesCus('Chính sách hoa hồng'),
                SizedBox(height: 5),
                Text(
                    'Mỗi đơn hàng đặt câu cá thành công sẽ được nhận mức hoa hồng là 6% cho mỗi đơn hàng phát sinh (chưa bao gồm VAT).')
              ],
            ),
            paddingCus(kW),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textStylesCus('Điều kiện ghi nhận'),
                SizedBox(height: 5),
                Text(
                    'Các bước thực hiện: (1) Cần thủ nhấn vào liên kết giới thiệu của bạn để truy cập -> (2) Đăng ký và điền đầy đủ thông tin -> (3) Người dùng hoàn tất đặt dịch vụ câu cá thành công.')
              ],
            ),
            paddingCus(kW),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textStylesCus('Lưu ý khác'),
                SizedBox(height: 5),
                Text(
                    '-Nghiêm cấm hành vi spam link trên các nền tảng.\n -Nghiêm cấm sử dụng link cho các mục đích khác ảnh\n -Nếu phát hiện vi phạm cần thủ sẽ bị cấm hoạt động và hủy hoa hồng')
              ],
            ),
            SizedBox(height: kW > 450 ? 70 : 0),
            Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 12, 12, 5),
                  child: ElevatedButton(
                      onPressed: () {
                        Get.snackbar(
                          "Tạo sự kiện mới",
                          "Thành công hay không chả liên quan",
                          colorText: Colors.white,
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.share),
                          SizedBox(width: 8),
                          CustomText(
                            text: 'Chia sẻ ngay',
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ],
                      )),
                )),
          ],
        ));
  }
}

class _buildEvenLinkIntroducedContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        // Your widget's content goes here.
        );
  }
}

Text textStylesCus(String text) {
  return Text(text,
      style: TextStyle(
          fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xff0B696C)));
}

Padding paddingCus(double kW) {
  return Padding(
      padding:
          EdgeInsets.only(top: kW > 450 ? 12 : 6, bottom: kW > 450 ? 12 : 6),
      child: Divider(height: 1, color: Color(0xff606060)));
}
