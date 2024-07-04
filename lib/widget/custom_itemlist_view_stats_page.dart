import 'package:flutter/material.dart';
import '../data/ref_detail_member.dart'; // Import the file where FishingPond is defined

class CustomItemRef extends StatelessWidget {
  final FishingPond pond;

  const CustomItemRef({Key? key, required this.pond}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: Color(0xFF000000), width: 0.5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                pond.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color(0xFF0B894C),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 8),
            ...pond.orderSummaries
                .map((summary) => _buildOrderSummary(summary))
                .toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderSummary(OrderSummary summary) {
    return OrderSummaryItem(summary: summary);
  }
}

class OrderSummaryItem extends StatelessWidget {
  final OrderSummary summary;

  const OrderSummaryItem({Key? key, required this.summary}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildDot(color: Color(0xFF898989)),
                SizedBox(width: 6),
                Text("Đơn hàng phát sinh"),
              ],
            ),
            Text("${summary.ordersGenerated}"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildDot(color: Color(0xFF1821EB)),
                SizedBox(width: 6),
                Text("Đơn đã thanh toán"),
              ],
            ),
            Text("${summary.ordersPaid}"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildDot(color: Color(0xFFD314F2)),
                // Example for "Doanh thu đã tạo"
                SizedBox(width: 6),
                Text("Hoa hồng phát sinh"),
              ],
            ),
            Text("${summary.commissionGenerated}"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildDot(color: Color(0xFFFAE20D)),
                // Example for "Doanh thu đã tạo"
                SizedBox(width: 6),
                Text("Chờ chuyển"),
              ],
            ),
            Text("${summary.pendingTransfer}"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildDot(color: Color(0xFF42EB18)),
                // Example for "Doanh thu đã tạo"
                SizedBox(width: 6),
                Text("Đã Chuyển"),
              ],
            ),
            Text("${summary.transferred}"),
          ],
        ),
      ],
    );
  }

  Widget _buildDot({required Color color}) {
    return Container(
      width: 10.0,
      height: 10.0,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(
          color: Color(0xFFDDDDDD),
          width: 2.0,
        ),
      ),
    );
  }
}
