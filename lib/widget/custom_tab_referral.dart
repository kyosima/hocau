import 'package:flutter/material.dart';

class CustomTab extends StatelessWidget {
  final String text;
  final bool isSelected;

  const CustomTab({
    Key? key,
    required this.text,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color textColor = isSelected ? const Color(0xFF0B894C) : Colors.grey;

    return Tab(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTabIndicator extends Decoration {
  final Color color;
  final double screenWidth;

  const CustomTabIndicator({required this.color, required this.screenWidth});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CustomPainter(color: color, width: screenWidth / 2);
  }
}

class _CustomPainter extends BoxPainter {
  final Paint _paint;
  final double width;

  _CustomPainter({required Color color, required this.width})
      : _paint = Paint()
          ..color = color
          ..strokeWidth = 2
          ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final Offset start =
        offset + Offset((cfg.size!.width - width) / 2, cfg.size!.height - 2);
    final Offset end = start + Offset(width, 0);
    canvas.drawLine(start, end, _paint);
  }
}
