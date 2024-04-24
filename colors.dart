import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

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
  });

  factory ColorList.light() {
    return ColorList(
      borderColor: Color(0xFFC4283C).withOpacity(.1),
      primary: Color(0xFFC4283C),
      constPrColor: Color(0xFFC4283C),
      menuButtonColor: darkGray,
      positiveGreen: Color(0xFF007C5A),
      ashWhiteLabel: Color(0xFF909090),
      tabBarColor: Color(0xFFFFFFFF),
      redWhiteOpacity: Color(0xFFC4283C).withOpacity(.1),
      redWhite: Color(0xFFC4283C),
      redOpacityWhite: Color(0xFFC4283C).withOpacity(.1),
      cardColor: Color(0xFFFFFFFF),
      greyWhite: Color(0xFF808080),
      blackWhite: Color(0xFF000000),
      successGreen: Color(0xFF269D57),
      whiteBlack: Color(0xFFFFFFFF),
    );
  }

  factory ColorList.dark() {
    return ColorList(
      borderColor: Color(0xFFFFFFFF).withOpacity(.4),
      primary: Color(0xFFF4384F),
      constPrColor: Color(0xFFC4283C),
      menuButtonColor: whiteColor,
      positiveGreen: Color(0xFF00A87A),
      ashWhiteLabel: Color(0xFFFFFFFF),
      tabBarColor: transparentColor,
      redWhiteOpacity: Color(0xFFFFFFFF).withOpacity(.3),
      redWhite: Color(0xFFFFFFFF),
      redOpacityWhite: Color(0xFFFFFFFF),
      cardColor: const Color.fromARGB(255, 34, 34, 34),
      greyWhite: Color(0xFFFFFFFF),
      blackWhite: Color(0xFFFFFFFF),
      whiteBlack: Color(0xFF000000),
      successGreen: Color(0xFF269D57),
    );
  }
}

class ColorCode {
  static ColorList colorList(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? ColorList.light()
        : ColorList.dark();
  }
}
