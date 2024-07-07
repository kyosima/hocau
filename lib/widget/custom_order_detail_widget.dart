import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../data/ref_detail_member.dart';

class CustomOrderDetailWidget extends StatelessWidget {
  final DetailedOrder order;
  final FishingPond pond;

  const CustomOrderDetailWidget({
    Key? key,
    required this.order,
    required this.pond,
  }) : super(key: key);

  int parseCurrency(String value) {
    print("Parsing currency value: $value");
    int parsedValue =
        int.tryParse(value.replaceAll('.', '').replaceAll('đ', '')) ?? 0;
    print("Parsed integer value: $parsedValue");
    return parsedValue;
  }

  String formatCurrency(int value) {
    final formatter = NumberFormat('#,##0', 'en_US');
    return '${formatter.format(value)}đ';
  }

  @override
  Widget build(BuildContext context) {
    int pendingTransferValue = parseCurrency(order.pendingTransfer);
    int transferredValue = parseCurrency(order.transferred);
    int totalValue = pendingTransferValue + transferredValue;
    String totalFormatted = formatCurrency(totalValue);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(pond.name,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
        ),
        const SizedBox(height: 3),
        const Padding(
          padding: EdgeInsets.all(10),
          child: Text('Hồ câu số 1',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
        ),
        _buildDetailRow('Đặt lúc: ', order.bookingTime,
            const Icon(Icons.access_time_filled_outlined)),
        _buildDetailRow(
            'Suất câu: ', order.fishingSlot, const Icon(Icons.phishing_outlined)),
        _buildDetailRow('Ngày câu: ', order.fishingDate,
            const Icon(Icons.calendar_today_outlined)),
        _buildDetailRow('Chờ chuyển: ', order.pendingTransfer,
            _buildColoredDot(const Color(0xFFFAE20D))),
        _buildDetailRow('Đã chuyển: ', order.transferred,
            _buildColoredDot(const Color(0xFF42EB18))),
        _buildDashedLine(context),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'TỔNG CỘNG: ',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black),
              ),
              Text(
                totalFormatted,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black),
              ),
              const SizedBox(height: 30),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildColoredDot(Color color) {
    return Container(
      width: 10.0,
      height: 10.0,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(
          color: const Color(0xFFDDDDDD),
          width: 2.0,
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, Widget? leadingWidget) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          if (leadingWidget != null) ...[
            IconTheme(
              data: const IconThemeData(size: 16),
              child: leadingWidget,
            ),
            const SizedBox(width: 8),
          ],
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(
              child: Text(
            value,
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          )),
        ],
      ),
    );
  }

  Widget _buildDashedLine(BuildContext context) {
    return CustomPaint(
      size: Size(MediaQuery.of(context).size.width, 1),
      painter: DashedLineCustomPainter(),
    );
  }
}

class DashedLineCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashWidth = 5.0, dashSpace = 5.0, startX = 0.0;
    final paint = Paint()
      ..color = const Color(0xFF808080)
      ..strokeWidth = 1;
    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
