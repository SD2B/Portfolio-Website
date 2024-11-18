import 'package:flutter/material.dart';

class ColorList {
  final Color? primary;
  final Color? constPrColor;
  final Color? borderColor;
  final Color? menuButtonColor;
  final Color? positiveGreen;
  final Color? successGreen;
  final Color? ashWhiteLabel;
  final Color? tabBarColor;
  final Color? redWhiteOpacity;
  final Color? redWhite;
  final Color? redOpacityWhite;
  final Color? cardColor;
  final Color? greyWhite;
  final Color? blackWhite;
  final Color? whiteBlack;
  final Color? textFieldHeder;

  ColorList({
    this.successGreen,
    this.primary,
    this.constPrColor,
    this.borderColor,
    this.menuButtonColor,
    this.positiveGreen,
    this.ashWhiteLabel,
    this.tabBarColor,
    this.redWhiteOpacity,
    this.redWhite,
    this.redOpacityWhite,
    this.cardColor,
    this.greyWhite,
    this.blackWhite,
    this.whiteBlack,
    this.textFieldHeder,
  });

  factory ColorList.light() {
    return ColorList(
      borderColor: const Color(0xFFC4283C).withOpacity(.1),
      primary: const Color(0xFFC4283C),
      constPrColor: const Color(0xFFC4283C),
      // menuButtonColor: darkGray,
      positiveGreen: const Color(0xFF007C5A),
      ashWhiteLabel: const Color(0xFF909090),
      tabBarColor: const Color(0xFFFFFFFF),
      redWhiteOpacity: const Color(0xFFC4283C).withOpacity(.1),
      redWhite: const Color(0xFFC4283C),
      redOpacityWhite: const Color(0xFFC4283C).withOpacity(.1),
      cardColor: const Color(0xFFFFFFFF),
      greyWhite: const Color(0xFF808080),
      blackWhite: const Color(0xFF000000),
      successGreen: const Color(0xFF269D57),
      whiteBlack: const Color(0xFFFFFFFF),
      textFieldHeder: const Color(0xFF242424),
    );
  }

  factory ColorList.dark() {
    return ColorList(
      borderColor: const Color(0xFFFFFFFF).withOpacity(.4),
      primary: const Color(0xFFF4384F),
      constPrColor: const Color(0xFFC4283C),
      // menuButtonColor: whiteColor,
      positiveGreen: const Color(0xFF00A87A),
      ashWhiteLabel: const Color(0xFFFFFFFF),
      tabBarColor: Colors.transparent,
      redWhiteOpacity: const Color(0xFFFFFFFF).withOpacity(.3),
      redWhite: const Color(0xFFFFFFFF),
      redOpacityWhite: const Color(0xFFFFFFFF),
      cardColor: const Color.fromARGB(255, 34, 34, 34),
      greyWhite: const Color(0xFFFFFFFF),
      blackWhite: const Color(0xFFFFFFFF),
      whiteBlack: const Color(0xFF000000),
      successGreen: const Color(0xFF269D57),
      textFieldHeder: const Color(0xFFFFFFFF),
    );
  }
}

class ColorCode {
  static ColorList colorList(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light ? ColorList.light() : ColorList.dark();
  }
}
