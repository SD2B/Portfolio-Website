import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../colors.dart';

class InProgress extends StatelessWidget {
  final String? header;
  final String? subHeader;
  const InProgress({super.key, this.header, this.subHeader});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Lottie.asset(
          "assets/lottie/inprogress.json",
          height: 300,
          width: 300,
        ),
        HeaderLabel(
          header: header ?? "In Progress",
          subHeader: subHeader ?? "This page is under construction",
          headFontSize: 20,
          centerAlign: true,
        ),
      ],
    ));
  }
}

class NoDataFound extends StatelessWidget {
  final String? message;
  final String? subtitle;
  final bool? nolottie;
  const NoDataFound({super.key, this.message, this.nolottie = false, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (nolottie == false) LottieBuilder.asset('assets/images/nodatafound.json', height: 200, width: 200, fit: BoxFit.fill),
          HeaderLabel(
            header: message ?? "",
            subHeader: subtitle ?? "",
            headFontSize: 15,
            centerAlign: true,
          ),
        ],
      ),
    );
  }
}

class HeaderLabel extends StatelessWidget {
  final String header;
  final String? subHeader;
  final String? para;
  final double? headFontSize;
  final bool centerAlign;
  const HeaderLabel({super.key, required this.header, this.subHeader, this.para, this.headFontSize, this.centerAlign = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: centerAlign == true ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(header, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: headFontSize ?? 24, fontWeight: FontWeight.w500, color: ColorCode.colorList(context).textFieldHeder)),
        if (subHeader != null) ...[
          const SizedBox(height: 5),
          Text(subHeader ?? "", style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 12, fontWeight: FontWeight.w400, color: ColorCode.colorList(context).ashWhiteLabel)),
        ],
        if (para != null) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(para ?? "", textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 12, fontWeight: FontWeight.w400, color: ColorCode.colorList(context).ashWhiteLabel)),
            ],
          ),
        ],
      ],
    );
  }
}
