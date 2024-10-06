import 'package:flutter/material.dart';
import 'package:my_portfolio/colors.dart';
import 'package:my_portfolio/common%20elements/image_container.dart';
import 'package:my_portfolio/screen/custom_appbar.dart';
import 'package:my_portfolio/screen/custom_sidebar.dart';
import 'package:nb_utils/nb_utils.dart';

import 'home.dart';

class CustomScaffold extends StatelessWidget {
  final Widget? childWidget;
  final bool? enableLeftPadding;
  const CustomScaffold({super.key, this.childWidget, this.enableLeftPadding = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCode.colorList(context).cardColor,
      body: ImageContainer(
        duration: Duration(seconds: 10),
        transitionDuration: Duration(seconds: 5),
        imageUrls: [for (int i = 4; i <= 5; i++) "assets/images/bg$i.jpg"],
        child: Column(
          children: [
            const CustomAppBar(),
            Stack(
              children: [
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black,
                    ),
                    padding: enableLeftPadding == true ? EdgeInsets.only(left: 80) : EdgeInsets.zero,
                    width: context.width() - 100,
                    height: context.height() - 100,
                    child: childWidget ?? const Home()),
                Positioned(
                  left: 10,
                  child: CustomSideBar(),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
