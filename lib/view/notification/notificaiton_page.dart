import 'package:flutter/material.dart';
import 'package:hocau/unit.dart';
import 'package:hocau/widget/custom_text.dart';
import 'package:intl/intl.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final kW = MediaQuery.of(context).size.width;
    final kH = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Thông báo'),
      ),
      body: Padding(
        padding: EdgeInsets.all(kW * 0.05),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: '1 Thông báo mới',
                  fontWeight: FontWeight.bold,
                ),
                CustomText(
                  text: 'Đánh dấu đã đọc',
                  color: sColor,
                  textDecoration: TextDecoration.underline,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.separated(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(1),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: boxShadow,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.notifications_none),
                                CustomText(
                                  text: DateFormat('hh:mm, dd/MM/yyyy')
                                      .format(DateTime.now()),
                                  fontSize: 14,
                                  color: Colors.black54,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            CustomText(
                              text: 'Đặt lịch câu cá thành công',
                              fontWeight: FontWeight.bold,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            CustomText(
                              text:
                                  '''Bạn vừa đặt lịch câu cá trên ứng dụng VIP Fishing thành công, hẹn gặp lại bạn tại chi nhánh hồ câu nhé!''',
                              color: Colors.black54,
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 15,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
