import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/core.dart';

class NextButtonWidget extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final Color backgroundColor;
  final Color fontColor;
  final Color borderColor;

  NextButtonWidget(
      {required this.label,
      required this.onTap,
      required this.backgroundColor,
      required this.fontColor,
      required this.borderColor});

  NextButtonWidget.green({
    required this.label,
    required this.onTap,
    this.backgroundColor = AppColors.darkGreen,
    this.fontColor = AppColors.white,
    this.borderColor = AppColors.green,
  });
  NextButtonWidget.white({
    required this.label,
    required this.onTap,
    this.backgroundColor = AppColors.white,
    this.fontColor = AppColors.grey,
    this.borderColor = AppColors.border,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 48,
        child: TextButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(backgroundColor),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                side:
                    MaterialStateProperty.all(BorderSide(color: borderColor))),
            onPressed: onTap,
            child: Text(label,
                style: GoogleFonts.notoSans(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: fontColor))));
  }
}
