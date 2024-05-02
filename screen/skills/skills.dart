// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hovering/hovering.dart';
import 'package:my_portfolio/colors.dart';
import 'package:my_portfolio/common%20elements/in_progress.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../vm/riverpod.dart';

class Skills extends ConsumerWidget {
  const Skills({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: context.height() - 88,
      width: context.width() - 88,
      // child: InProgress(),
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HeaderLabel(
                    header: "Skills",
                    subHeader: "I am a Flutter Developer",
                    headFontSize: 40,
                    centerAlign: true),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderLabel(header: "Core Skills", headFontSize: 20),
                20.height,
                Wrap(
                  children: [
                    ...ref.watch(mainVM).coreSkills.map((e) => SkillCard(
                          skillName: e.name.toString(),
                          svg: e.svg.toString(),
                        )),
                  ],
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderLabel(header: "Design Skills", headFontSize: 20),
                20.height,
                Wrap(
                  children: [
                    ...ref.watch(mainVM).designSkills.map((e) => SkillCard(
                          skillName: e.name.toString(),
                          svg: e.svg.toString(),
                        )),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SkillCard extends ConsumerWidget {
  final String skillName;
  final String svg;
  const SkillCard({
    super.key,
    required this.skillName,
    required this.svg,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: HoverAnimatedContainer(
        height: 40,
        hoverHeight: 50,
        width: 150,
        hoverWidth: 150,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: ColorCode.colorList(context).cardColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              svg,
              height: 30,
              width: 30,
            ),
            10.width,
            Text(
              skillName,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
