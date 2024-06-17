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
          fontSize: 20,
          fontWeight: FontWeight.w700,
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
                  padding: EdgeInsets.all(10),
                  tabAlignment: TabAlignment.start,
                  labelColor: Color(0xFF0B894C),
                  indicatorColor: Color(0xFF0B894C),
                  isScrollable: true,
                  tabs: [
                    Tab(
                      child: CustomText(
                        text: 'Tất cả',
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF0B894C),
                      ),
                    ),
                    Tab(
                      child: CustomText(
                        text: 'Chưa thanh toán',
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF0B894C),
                      ),
                    ),
                    Tab(
                      child: CustomText(
                        text: 'Đã Đặt',
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF0B894C),
                      ),
                    ),
                    Tab(
                      child: CustomText(
                        text: 'Đã hủy',
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF0B894C),
                      ),
                    ),
                    Tab(
                      child: CustomText(
                        text: 'Đang câu',
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF0B894C),
                      ),
                    ),
                    Tab(
                      child: CustomText(
                        text: 'Hoàn thành',
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF0B894C),
                      ),
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
