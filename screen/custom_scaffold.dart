import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:metaballs/metaballs.dart';
import 'package:my_portfolio/colors.dart';
import 'package:my_portfolio/common%20elements/in_progress.dart';
import 'package:my_portfolio/helpers/responsive_helper.dart';
import 'package:my_portfolio/screen/custom_appbar.dart';
import 'package:my_portfolio/screen/custom_sidebar.dart';
import 'package:my_portfolio/screen/home.dart';
import 'package:nb_utils/nb_utils.dart';

class CustomScaffold extends StatelessWidget {
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  const CustomScaffold({super.key, this.child, this.padding});

  @override
  Widget build(BuildContext context) {
    final respoW = ResponsiveHelper.isDesktop(context);
    return Scaffold(
      backgroundColor: ColorCode.colorList(context).cardColor,
      body: !respoW
          ? SizedBox(
              width: context.width(),
              height: context.height(),
              child: InProgress(
                header: "Sorry For The Inconvenience - Work In Progress",
                subHeader: "Currently this website is available on desktop view only",
              ))
          : Metaballs(
              color: const Color.fromARGB(255, 66, 133, 244),
              effect: MetaballsEffect.follow(
                growthFactor: 1,
                smoothing: 1,
                radius: 0.5,
              ),
              gradient: const LinearGradient(colors: [
                // Color.fromARGB(255, 90, 60, 255),
                // Color.fromARGB(255, 120, 255, 255),
                Color(0xFFcf8e7c), // Main color
                Color(0xFFf6c2b5), // Light Peach
                Color(0xFFe76a5b), // Salmon
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
                      BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.black.withOpacity(.6),
                          ),
                          padding: padding ?? EdgeInsets.zero,
                          width: context.width() - 100,
                          height: context.height() - 100,
                          child: child ?? const Home(),
                          // child: AnimatedScrollView(children: []),
                        ),
                      ),
                      const Positioned(
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
