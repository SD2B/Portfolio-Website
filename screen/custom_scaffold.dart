import 'package:flutter/material.dart';
import 'package:my_portfolio/screen/custom_appbar.dart';
import 'package:my_portfolio/screen/custom_sidebar.dart';

import 'home.dart';

class CustomScaffold extends StatelessWidget {
  final Widget? childWidget;
  const CustomScaffold({super.key, this.childWidget});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          const CustomAppBar(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomSideBar(),
              childWidget ?? const Home(),
            ],
          ),
        ],
      ),
    );
  }
}
