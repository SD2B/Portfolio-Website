import 'package:flutter/material.dart';
import 'package:metaballs/metaballs.dart';
import 'package:my_portfolio/colors.dart';
import 'package:my_portfolio/common%20elements/image_container.dart';
import 'package:my_portfolio/screen/custom_appbar.dart';
import 'package:my_portfolio/screen/custom_sidebar.dart';
import 'package:my_portfolio/screen/home.dart';
import 'package:nb_utils/nb_utils.dart';

class CustomScaffold extends StatelessWidget {
  final Widget? childWidget;
  final EdgeInsetsGeometry? padding;
  const CustomScaffold({super.key, this.childWidget, this.padding});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCode.colorList(context).cardColor,
      body: Container(
        // duration: Duration(seconds: 10),
        // transitionDuration: Duration(seconds: 5),
        // imageUrls: [for (int i = 4; i <= 5; i++) "assets/images/bg$i.webp"],
        child: Metaballs(
          color: const Color.fromARGB(255, 66, 133, 244),
          effect: MetaballsEffect.follow(
            growthFactor: 1,
            smoothing: 1,
            radius: 0.5,
          ),
          gradient: LinearGradient(colors: [
            const Color.fromARGB(255, 90, 60, 255),
            const Color.fromARGB(255, 120, 255, 255),
          ], begin: Alignment.bottomRight, end: Alignment.topLeft),
          metaballs: 40,
          animationDuration: const Duration(milliseconds: 200),
          speedMultiplier: 1,
          bounceStiffness: 3,
          minBallRadius: 15,
          maxBallRadius: 40,
          glowRadius: 0.7,
          glowIntensity: 0.6,
          child: Column(
            children: [
              const CustomAppBar(),
              Stack(
                children: [
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black.withOpacity(.6),
                      ),
                      padding: padding ?? EdgeInsets.zero,
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
      ),
    );
  }
}
