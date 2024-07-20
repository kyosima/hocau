import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:hocau/data/member.dart';

import '../../../data/ref_detail_member.dart';
import '../../../widget/custom_order_detail_widget.dart';

import 'package:intl/intl.dart';

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
  DateTime? _selectedDay;

  void _toggleDetailVisibility() {
    setState(() {
      _isDetailVisible = !_isDetailVisible;
    });
  }

  void _showCalendarDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        DateTime? localSelectedDay = _selectedDay ?? DateTime.now();
        DateTime localFocusedDay = _selectedDay ?? DateTime.now();

        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          backgroundColor: Colors.white,
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return SizedBox(
                height: 500,
                child: Container(
                  width: double.maxFinite,
                  child: TableCalendar(
                    firstDay: DateTime.utc(2010, 10, 16),
                    lastDay: DateTime.utc(2030, 3, 14),
                    focusedDay: localFocusedDay,
                    selectedDayPredicate: (day) =>
                        isSameDay(localSelectedDay, day),
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        localSelectedDay = selectedDay;
                        localFocusedDay = focusedDay;
                      });
                    },
                    onPageChanged: (focusedDay) {
                      setState(() {
                        localFocusedDay = focusedDay;
                      });
                    },
                    calendarStyle: CalendarStyle(
                      todayDecoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                      selectedDecoration: BoxDecoration(
                        color: Colors.deepOrange,
                        shape: BoxShape.circle,
                      ),
                      outsideDaysVisible: false,
                    ),
                    headerStyle: HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                      titleTextStyle: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    daysOfWeekStyle: DaysOfWeekStyle(
                      weekendStyle: TextStyle(color: Colors.red),
                    ),
                    // Other properties...
                  ),
                ),
              );
            },
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Close', style: TextStyle(color: Colors.red)),
              onPressed: () {
                setState(() {
                  _selectedDay = localSelectedDay;
                });
                Navigator.of(context).pop();
              },
              style: ButtonStyle(
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    side: BorderSide(color: Colors.red),
                  ),
                ),
              ),
            ),
            TextButton(
              child: Text('Okay', style: TextStyle(color: Colors.blue)),
              onPressed: () {
                setState(() {
                  _selectedDay = localSelectedDay;
                });
                Navigator.of(context).pop();
              },
              style: ButtonStyle(
                foregroundColor: WidgetStateProperty.all<Color>(Colors.blue),
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    side: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(context),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildHeader(),
              ListTile(
                tileColor: Color(0x402874CA),
                title: Text(
                  _selectedDay != null
                      ? 'Tháng ' + DateFormat('MM/yyyy').format(_selectedDay!)
                      : 'Tháng ' + DateFormat('MM/yyyy').format(DateTime.now()),
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
              _selectedDay != null && _selectedDay!.isAfter(DateTime.now())
                  ? const SizedBox(
                      height: 500,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Bạn không thể chọn ngày trong tương lai.',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Visibility(
                      visible: _isDetailVisible,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: widget.pond.detailedOrders.length * 2,
                        itemBuilder: (context, index) {
                          int actualIndex =
                              index % widget.pond.detailedOrders.length;
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
                  DateFormat('dd/MM').format(DateTime.now()) +
                      ' - ' +
                      DateFormat('dd/MM')
                          .format(DateTime.now().add(Duration(days: 1))),
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
