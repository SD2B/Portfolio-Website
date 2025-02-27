// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/common%20elements/in_progress.dart';
import 'package:my_portfolio/helpers/responsive_helper.dart';
import 'package:my_portfolio/helpers/sddb_helper.dart';
import 'package:my_portfolio/screen/skills/skill_card.dart';

import '../../vm/riverpod.dart';

class Skills extends ConsumerWidget {
  const Skills({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final respo = ResponsiveHelper.isDesktop(context);
    return SizedBox(
      width: respo ? context.width() - 88 : context.width(),
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Column(
          children: [
            HeaderLabel(header: "Skills", headFontSize: 40, centerAlign: true),
            if (!respo) 10.height,
            SizedBox(
              width: respo ? context.width() - 320 : context.width(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: respo ? CrossAxisAlignment.start : CrossAxisAlignment.center,
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
                  ),
                  20.height,
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
