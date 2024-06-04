import 'package:flutter/material.dart';

import '../unit.dart';

class CustomMarker extends StatelessWidget {
  const CustomMarker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        CircleAvatar(
          radius: 150,
          backgroundColor: pColor,
          child: Padding(
            padding: const EdgeInsets.all(10), // Border radius
            child: ClipOval(
              child: Image.asset(
                'assets/images/mark.png',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
