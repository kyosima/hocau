import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDialog extends StatelessWidget {
  final IconData icon;
  final String title;
  final String content;
  final String cancelButtonText;
  final String confirmButtonText;
  final VoidCallback onCancel;
  final VoidCallback onConfirm;

  CustomDialog({
    required this.icon,
    required this.title,
    required this.content,
    required this.cancelButtonText,
    required this.confirmButtonText,
    required this.onCancel,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      child: contentBox(context),
    );
  }

  contentBox(BuildContext context) {
    return Container(
      height: 268,
      width: 312,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            height: 180,
            child: Padding(
                padding: EdgeInsets.fromLTRB(24, 24, 24, 0),
                child: Column(
                  children: [
                    Icon(
                      icon,
                      size: 24,
                      color: Colors.black,
                    ),
                    SizedBox(height: 16),
                    Text(
                      title,
                      style: GoogleFonts.beVietnamPro(
                          textStyle: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w700)),
                    ),
                    SizedBox(height: 16),
                    Text(
                      content,
                      style: GoogleFonts.beVietnamPro(
                          textStyle: TextStyle(
                              height: 1.6,
                              fontSize: 14,
                              fontWeight: FontWeight.w400)),
                      textAlign: TextAlign.start,
                    ),
                  ],
                )),
          ),
          SizedBox(
            height: 88,
            child: Padding(
                padding: EdgeInsets.only(left: 80),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    TextButton(
                      onPressed: onCancel,
                      child: Text(
                        cancelButtonText,
                        style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff0B894C),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    TextButton(
                      onPressed: onConfirm,
                      child: Text(
                        confirmButtonText,
                        style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff0B894C),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
