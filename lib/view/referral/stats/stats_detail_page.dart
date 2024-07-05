import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:hocau/data/member.dart';

import '../../../data/ref_detail_member.dart';
import '../../../widget/CustomOrderDetailWidget.dart';

class StatsDetailPage extends StatefulWidget {
  final Member member;
  final FishingPond pond;

  const StatsDetailPage({Key? key, required this.member, required this.pond})
      : super(key: key);

  @override
  _StatsDetailPageState createState() => _StatsDetailPageState();
}

class _StatsDetailPageState extends State<StatsDetailPage> {
  bool _isDetailVisible = true;

  void _toggleDetailVisibility() {
    setState(() {
      _isDetailVisible = !_isDetailVisible;
    });
  }

  void _showCalendarDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            width: double.maxFinite,
            child: TableCalendar(
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: DateTime.now(),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Container(
        color: const Color(0xFFffffff),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildHeader(),
              ListTile(
                tileColor: Color(0x402874CA),
                title: Text(
                  'Tháng 4/2024',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF000000),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _isDetailVisible ? 'Rút gọn' : 'Mở rộng',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFF001F42),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: Icon(_isDetailVisible
                          ? Icons.arrow_upward_outlined
                          : Icons.arrow_downward_outlined),
                      onPressed: _toggleDetailVisibility,
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: _isDetailVisible,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: widget.pond.detailedOrders.length * 2,
                  itemBuilder: (context, index) {
                    int actualIndex = index % widget.pond.detailedOrders.length;
                    return Column(
                      children: [
                        CustomOrderDetailWidget(
                          order: widget.pond.detailedOrders[actualIndex],
                          pond: widget.pond,
                        ),
                        Container(
                          height: 5,
                          color: Color(0xFFDDDDDD),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        'Chi tiết',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        color: Colors.white,
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                SizedBox(width: 12),
                Text(
                  'Đơn hàng của ',
                  style: TextStyle(fontSize: 11, color: Colors.black),
                ),
                SizedBox(width: 2),
                Text(
                  '${widget.member.name}',
                  style: TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(12),
            width: 170,
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                SizedBox(width: 12),
                Text(
                  '01/12 - 01/01',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 12),
                  width: 1,
                  height: 49,
                  color: Colors.black,
                ),
                Expanded(
                  child: Container(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        icon: Icon(Icons.calendar_today_outlined,
                            color: Colors.black),
                        onPressed: _showCalendarDialog,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
