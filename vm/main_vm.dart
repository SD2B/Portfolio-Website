
import 'package:flutter/material.dart';

import '../helpers/sddb_helper.dart';

class MainVM extends ChangeNotifier {
  MainVM() {
    printx('MainVM');
  }
  void refresh(){
    notifyListeners();
  }
  bool isLightTheme = true;

}

