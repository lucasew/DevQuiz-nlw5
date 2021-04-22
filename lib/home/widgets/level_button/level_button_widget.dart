import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/core.dart';

class LevelButtonWidget extends StatelessWidget {
  final String label;
  final Color borderColor;
  final Color buttonColor;
  final Color textColor;

  LevelButtonWidget._(
      {required this.label,
      required this.borderColor,
      required this.textColor,
      required this.buttonColor,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            color: this.buttonColor,
            border: Border.fromBorderSide(BorderSide(color: this.borderColor))),
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Text(label,
                textAlign: TextAlign.center,
                style: GoogleFonts.notoSans(
                    color: this.textColor, fontSize: 13))));
    // FIXME: cadê o texto :v
  }

  static LevelButtonWidget facil({Key? key}) {
    return LevelButtonWidget._(
        borderColor: AppColors.levelButtonBorderFacil,
        textColor: AppColors.levelButtonTextFacil,
        buttonColor: AppColors.levelButtonFacil,
        label: "Fácil",
        key: key);
  }

  static LevelButtonWidget medio({Key? key}) {
    return LevelButtonWidget._(
        borderColor: AppColors.levelButtonBorderMedio,
        textColor: AppColors.levelButtonTextMedio,
        buttonColor: AppColors.levelButtonMedio,
        label: "Médio",
        key: key);
  }

  static LevelButtonWidget dificil({Key? key}) {
    return LevelButtonWidget._(
        borderColor: AppColors.levelButtonBorderDificil,
        textColor: AppColors.levelButtonTextDificil,
        buttonColor: AppColors.levelButtonDificil,
        label: "Difícil",
        key: key);
  }

  static LevelButtonWidget perito({Key? key}) {
    return LevelButtonWidget._(
        borderColor: AppColors.levelButtonBorderPerito,
        textColor: AppColors.levelButtonTextPerito,
        buttonColor: AppColors.levelButtonPerito,
        label: "Perito",
        key: key);
  }
}
