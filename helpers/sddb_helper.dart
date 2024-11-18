import 'package:flutter/material.dart';

printx(dynamic data, [String? tag]) {
  final String ttag = tag != null ? tag.toString() : '';
  debugPrint("$ttag : $data");
}

extension SizedBoxExtensions on num {
  SizedBox get width => SizedBox(width: toDouble());
  SizedBox get height => SizedBox(height: toDouble());
}

extension ContextExtensions on BuildContext {
  double width() => MediaQuery.of(this).size.width;
  double height() => MediaQuery.of(this).size.height;
}
