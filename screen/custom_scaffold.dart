import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:metaballs/metaballs.dart';
import 'package:my_portfolio/common%20elements/in_progress.dart';
import 'package:my_portfolio/helpers/responsive_helper.dart';
import 'package:my_portfolio/helpers/sddb_helper.dart';
import 'package:my_portfolio/screen/contact/contact.dart';
import 'package:my_portfolio/screen/custom_appbar.dart';
import 'package:my_portfolio/screen/custom_sidebar.dart';
import 'package:my_portfolio/screen/home.dart';
import 'package:my_portfolio/screen/plugins/plugins.dart';
import 'package:my_portfolio/screen/projects/projects.dart';
import 'package:my_portfolio/screen/skills/skills.dart';
import 'package:page_flow/page_flow.dart';

class CustomScaffold extends HookWidget {
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  const CustomScaffold({super.key, this.child, this.padding});

  @override
  Widget build(BuildContext context) {
    final scrollViewController = useRef(MultiPageViewController()).value;
    final respoW = ResponsiveHelper.isDesktop(context);

    final sections = [
      HomeMainSection(),
      Skills(),
      Projects(),
      Plugins(),
      ContactMe(),
    ];
    return Scaffold(
      backgroundColor: Colors.black,
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
                Color(0xFFD6D6D6),
                Color(0xFFA1A1A1),
                Color(0xFF8C8C8C),
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
                            child: Container(
                              width: 600,
                              height: 600,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      height: context.height() - 88,
                                      child: PageFlow(
                                        controller: scrollViewController,
                                        sections: [30.height, for (int i = 0; i < sections.length; i++) PageWidget(title: "$i", child: Padding(padding: EdgeInsets.only(bottom: (i != (sections.length - 1)) ? 100 : 0), child: sections[i]))],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ),
                      Positioned(
                        left: 10,
                        child: CustomSideBar(scrollViewController: scrollViewController),
                      )
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
