import 'package:flutter/material.dart';
import 'package:hocau/unit.dart';
import 'package:hocau/widget/custom_card.dart';
import 'package:hocau/widget/custom_text.dart';

class BookingHistoryPage extends StatefulWidget {
  const BookingHistoryPage({super.key});

  @override
  State<BookingHistoryPage> createState() => _BookingHistoryPageState();
}

class _BookingHistoryPageState extends State<BookingHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
        ),
        title: CustomText(
          text: 'Lịch sử đặt lịch',
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
      ),
      body: DefaultTabController(
        length: 6,
        initialIndex: 0,
        child: Container(
          color: highLightShimmer,
          child: Column(
            children: [
              TabBar(
                  tabAlignment: TabAlignment.start,
                  labelColor: Colors.green,
                  indicatorColor: Colors.green,
                  isScrollable: true,
                  tabs: [
                    Tab(
                      text: 'Tất cả',
                    ),
                    Tab(
                      text: 'Chưa thanh toán',
                    ),
                    Tab(
                      text: 'Đã đặt',
                    ),
                    Tab(
                      text: 'Đã hủy',
                    ),
                    Tab(
                      text: 'Đang câu',
                    ),
                    Tab(
                      text: 'Hoàn Thành',
                    ),
                  ]),
              Flexible(
                fit: FlexFit.loose,
                child: TabBarView(children: <Widget>[
                  CustomCard(
                    itemCount: 4,
                  ),
                  CustomCard(
                    itemCount: 2,
                  ),
                  CustomCard(
                    itemCount: 3,
                  ),
                  CustomCard(
                    itemCount: 1,
                  ),
                  CustomCard(
                    itemCount: 2,
                  ),
                  CustomCard(
                    itemCount: 2,
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
