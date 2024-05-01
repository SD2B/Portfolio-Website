import 'package:flutter/material.dart';

import '../helpers/sddb_helper.dart';

class MainVM extends ChangeNotifier {
  MainVM() {
    printx('MainVM');
  }
  void refresh() {
    notifyListeners();
  }

  bool isLightTheme = true;
  bool isHovered = false;

  void setHovered(bool bool) {
    isHovered = bool;
    notifyListeners();
  }


  Map<String, dynamic> skills = {
    "Flutter": {
      "name": "Flutter",
      "svgl": "assets/svg/flutter.svg",
      "svgd": "assets/svg/flutter.svg",
    },
    "Dart": {
      "name": "Dart",
      "svgl": "assets/svg/dart.svg",
      "svgd": "assets/svg/dart.svg",
    },
    "Firebase": {
      "name": "Firebase",
      "svgl": "assets/svg/firebase.svg",
      "svgd": "assets/svg/firebase.svg",
    },
    "NodeJS": {
      "name": "NodeJS",
      "svgl": "assets/svg/nodejs.svg",
      "svgd": "assets/svg/nodejs.svg",
    },
    "MongoDB": {
      "name": "MongoDB",
      "svgl": "assets/svg/mongodb.svg",
      "svgd": "assets/svg/mongodb.svg",
    },
   
  };

}
