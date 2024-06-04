import 'package:flutter/material.dart';
import 'package:hocau/widget/custom_text.dart';
import 'package:intl/intl.dart';

class BlogDetailPage extends StatelessWidget {
  const BlogDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final kW = MediaQuery.of(context).size.width;
    final kH = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Chi tiết bài viết'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/new.png',
              width: kW,
            ),
            Padding(
              padding: EdgeInsets.all(kW * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: DateFormat('dd/MM/yyyy').format(DateTime.now()),
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomText(
                    text: 'Thời điểm lý tưởng nhất để đi câu cá!',
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomText(
                    text:
                        'Câu cá là một hoạt động giải trí thú vị và lành mạnh được nhiều người yêu thích. Để lên được nhiều cá hoặc săn được cá lớn cần có nhiều yếu tố, trong đó thời điểm đi câu đóng một vai trò quan trọng. Theo kinh nghiệm của các cần thủ, thời điểm tốt nhất để đi câu cá là khi các loài cá bước vào chu kỳ hoạt động nhiều năng lượng nhất. Điều này thường xảy ra vào lúc mặt trời mọc, khi trời mưa, kỳ trăng non và lúc hoàng hôn.',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomText(
                    text: 'Thời điểm lý tưởng nhất để đi câu cá!',
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomText(
                    text:
                        'Câu cá là một hoạt động giải trí thú vị và lành mạnh được nhiều người yêu thích. Để lên được nhiều cá hoặc săn được cá lớn cần có nhiều yếu tố, trong đó thời điểm đi câu đóng một vai trò quan trọng. Theo kinh nghiệm của các cần thủ, thời điểm tốt nhất để đi câu cá là khi các loài cá bước vào chu kỳ hoạt động nhiều năng lượng nhất. Điều này thường xảy ra vào lúc mặt trời mọc, khi trời mưa, kỳ trăng non và lúc hoàng hôn.',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
