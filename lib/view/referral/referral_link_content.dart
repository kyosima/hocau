import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ReferralLinkController extends GetxController {
  // Add your logic here if needed
}

class ReferralLinkContent extends GetView<ReferralLinkController> {
  const ReferralLinkContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle customTitleStyle = const TextStyle(
      color: Color(0xFF0B894C),
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );
    TextStyle customNotesStyle = const TextStyle(
      color: Color(0xFF000000),
      fontSize: 12.7,
      fontWeight: FontWeight.normal,
    );
    TextStyle customNotesStyle2 = const TextStyle(
      color: Color(0xFF808080),
      fontSize: 12.7,
      fontWeight: FontWeight.normal,
    );

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Liên kết giới thiệu',
                  style: customTitleStyle,
                ),
                SizedBox(height: 10),
                Text(
                  'Bạn có thể sử dụng link này để giới thiệu dịch vụ cho người thân, bạn bè,... Khi bạn giới thiệu thành công sẽ nhận được hoa hồng',
                  style: customNotesStyle,
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(
              height: 0.3,
              color: Color(0xFF808080),
            ),
            SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Link của bạn',
                        style: customTitleStyle,
                      ),
                      SizedBox(height: 10),
                      SelectableText(
                        'https://shorten.asia/Abcxyz123',
                        style: customNotesStyle2,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.copy),
                  onPressed: () {
                    Clipboard.setData(
                        ClipboardData(text: 'https://shorten.asia/Abcxyz123'));
                  },
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(
              height: 0.3,
              color: Color(0xFF808080),
            ),
            SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mã giới thiệu của bạn',
                        style: customTitleStyle,
                      ),
                      SizedBox(height: 10),
                      SelectableText(
                        'CT00123456',
                        style: customNotesStyle2,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.qr_code_2_sharp),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(
              height: 0.3,
              color: Color(0xFF808080),
            ),
            SizedBox(height: 10),
            Text(
              'Chính sách hoa hồng',
              style: customTitleStyle,
            ),
            Text(
              'Mỗi đơn hàng đặt câu cá thành công sẽ được nhận mức hoa hồng là 10% cho mỗi đơn hàng phát sinh (chưa bao gồm VAT).',
              style: customNotesStyle,
            ),
            SizedBox(height: 10),
            Container(
              height: 0.3,
              color: Color(0xFF808080),
            ),
            SizedBox(height: 10),
            Text(
              'Điều kiện ghi nhận',
              style: customTitleStyle,
            ),
            Text(
              'Các bước thực hiện: (1) Cần thủ nhấn vào liên kết giới thiệu của bạn để truy cập -> (2) Đăng ký và điền đầy đủ thông tin -> (3) Người dùng hoàn tất đặt dịch vụ câu cá thành công.',
              style: customNotesStyle,
            ),
            SizedBox(height: 10),
            Container(
              height: 0.3,
              color: Color(0xFF808080),
            ),
            SizedBox(height: 10),
            Text(
              'Lưu ý khác',
              style: customTitleStyle,
            ),
            Text(
              '- Nghiêm cấm hành vi spam link trên các nền tảng.\n\n- Nghiêm cấm sử dụng link cho các mục đích khác ảnh\n\n- Nếu phát hiện vi phạm cần thủ sẽ bị cấm hoạt động và hủy hoa hồng',
              style: customNotesStyle,
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          width: 350,
          height: 40,
          child: ElevatedButton.icon(
            icon: Icon(Icons.share_sharp, color: Colors.white, size: 16),
            label: Text('Chia sẻ ngay', style: TextStyle(color: Colors.white)),
            onPressed: () {
              //TODO: Share link
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF0B894C),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
