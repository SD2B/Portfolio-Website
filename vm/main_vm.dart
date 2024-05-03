import 'package:flutter/material.dart';

import '../helpers/sddb_helper.dart';
import '../model/skill_model.dart';

class MainVM extends ChangeNotifier {
  MainVM() {
    printx('MainVM');
  }
  void refresh() {
    notifyListeners();
  }

  bool isLightTheme = true;
  bool isHovered = false;
  bool isHozzoHovered = false;
  bool isIsseloHovered = false;
  SkillModel skillModel = const SkillModel();
  List<SkillModel> coreSkills = [
    const SkillModel(id: 1, name: 'Flutter', svg: 'assets/svg/flutter.svg'),
    const SkillModel(id: 2, name: 'Dart', svg: 'assets/svg/dart.svg'),
    const SkillModel(id: 3, name: 'NodeJS', svg: 'assets/svg/nodejs.svg'),
    const SkillModel(id: 4, name: 'MongoDB', svg: 'assets/svg/mongodb.svg'),
    const SkillModel(id: 5, name: 'MySQL', svg: 'assets/svg/mysql.svg'),
    const SkillModel(id: 6, name: 'Firebase', svg: 'assets/svg/firebase.svg'),
    const SkillModel(id: 7, name: 'Java', svg: 'assets/svg/java.svg'),
    const SkillModel(id: 9, name: 'Python', svg: 'assets/svg/python.svg'),
    const SkillModel(id: 10, name: 'HTML', svg: 'assets/svg/html.svg'),
    const SkillModel(id: 11, name: 'CSS', svg: 'assets/svg/css.svg'),
    const SkillModel(
        id: 12, name: 'JavaScript', svg: 'assets/svg/javascript.svg'),
    const SkillModel(id: 12, name: 'Api', svg: 'assets/svg/api.svg'),
  ];
  List<SkillModel> designSkills = [
    const SkillModel(id: 1, name: 'Adobe Express', svg: 'assets/svg/adobe.svg'),
    const SkillModel(id: 2, name: 'Figma', svg: 'assets/svg/figma.svg'),
    const SkillModel(id: 3, name: 'Photoshop', svg: 'assets/svg/photoshop.svg'),
    const SkillModel(id: 6, name: 'InkScape', svg: 'assets/svg/inkscape.svg'),
  ];

  void setHovered(bool bool) {
    isHovered = bool;
    notifyListeners();
  }
}
