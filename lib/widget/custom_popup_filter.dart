import 'package:flutter/material.dart';

class CustomPopupFilter {
  static OverlayEntry? arrowOverlayEntry;

  static void showCustomMenu({
    required BuildContext context,
    required RelativeRect position,
    required List<PopupMenuEntry> items,
  }) {
    _removeExistingOverlay();

    arrowOverlayEntry = OverlayEntry(builder: (_) {
      return Positioned(
        left: position.left + 5,
        top: position.top - 10,
        child: CustomPaint(
          painter: ArrowPainter(),
          size: const Size(20, 10),
        ),
      );
    });

    Overlay.of(context).insert(arrowOverlayEntry!);

    showMenu(
      color: const Color(0xFF0B894C),
      context: context,
      position: position,
      items: items,
    ).then((value) {
      _removeExistingOverlay();
    });
  }

  static void _removeExistingOverlay() {
    if (arrowOverlayEntry != null) {
      arrowOverlayEntry!.remove();
      arrowOverlayEntry = null;
    }
  }
}

class ArrowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color(0xFF0B894C)
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(8, 10);
    path.lineTo(19, 1); // Top point
    path.lineTo(21, 20); // Right bottom
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class CustomCheckbox extends StatelessWidget {
  final bool initialValue;
  final ValueChanged<bool> onChanged;

  const CustomCheckbox({
    Key? key,
    required this.initialValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(!initialValue);
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(5),
          color: initialValue ? const Color(0xFFFF9900) : Colors.white,
        ),
        child: initialValue
            ? const Icon(
          Icons.check,
          size: 16,
          color: Colors.white,
        )
            : null,
      ),
    );
  }
}

class FilterOption extends StatefulWidget {
  final String rank;
  final int count;
  final bool isSelected;
  final ValueChanged<String> onSelected;

  const FilterOption({
    Key? key,
    required this.rank,
    required this.count,
    this.isSelected = false,
    required this.onSelected,
  }) : super(key: key);

  @override
  _FilterOptionState createState() => _FilterOptionState();
}

class _FilterOptionState extends State<FilterOption> {
  late bool isSelected;

  @override
  void initState() {
    super.initState();
    isSelected = widget.isSelected;
  }

  void _handleTap() {
    widget.onSelected(widget.rank);
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            CustomCheckbox(
              initialValue: isSelected,
              onChanged: (isChecked) {
                _handleTap();
              },
            ),
            const SizedBox(width: 10),
            Text(
              widget.rank,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 30),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                    color: const Color(0xFF064E3B),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "${widget.count}",
                      style: const TextStyle(color: Colors.white, fontSize: 9),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
