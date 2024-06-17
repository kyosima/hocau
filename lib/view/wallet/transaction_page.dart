import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hocau/unit.dart';
import 'package:hocau/widget/custom_card.dart';
import 'package:hocau/widget/custom_text.dart';
import 'package:intl/intl.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  Widget build(BuildContext context) {
    final kW = MediaQuery.of(context).size.width;
    final kH = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
        ),
        centerTitle: true,
        title: CustomText(
          text: 'Giao dịch',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      body: DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Column(
          children: [
            TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: Colors.green,
              indicatorColor: Colors.green,
              tabs: [
                Tab(
                  child: CustomText(
                    text: 'Thanh toán',
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Color(0xff0B894C),
                  ),
                ),
                Tab(
                  child: CustomText(
                    text: 'Nạp/Rút',
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Color(0xff0B894C),
                  ),
                )
              ],
            ),
            Container(
              color: Color(0xFFF3F4F6),
              padding:
                  EdgeInsets.symmetric(horizontal: kW * 0.05, vertical: 10),
              child: Row(
                children: [
                  CustomText(
                    text: 'Bộ lọc',
                    fontWeight: FontWeight.bold,
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        color: highLightShimmer,
                        border: Border.all(),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Row(children: [
                      CustomText(
                        text:
                            '${DateFormat('dd/MM').format(DateTime.now())} - ${DateFormat('dd/MM').format(DateTime.now().add(new Duration(days: 7)))}',
                      ),
                      Container(
                        child: IconButton(
                          onPressed: () {
                            showDateRangePicker(
                              barrierDismissible: false,
                              context: context,
                              builder: (context, child) {
                                return Container(
                                  padding: EdgeInsets.all(kW * 0.05),
                                  child: DateRangePickerDialog(
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2025),
                                    initialDateRange: DateTimeRange(
                                        start: DateTime.now(),
                                        end: DateTime.now()
                                            .add(Duration(days: 7))),
                                  ),
                                );
                              },
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2000),
                            );
                          },
                          icon: Icon(Icons.date_range),
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
            Flexible(
                child: TabBarView(
              children: [CustomCardWallet(), CustomCardWallet()],
            ))
          ],
        ),
      ),
    );
  }
}
