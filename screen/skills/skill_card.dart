import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tilt/flutter_tilt.dart';
import 'package:my_portfolio/colors.dart';
import 'package:my_portfolio/helpers/sddb_helper.dart';

class SkillCard extends ConsumerWidget {
  final String skillName;
  final String svg;
  const SkillCard({super.key, required this.skillName, required this.svg});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Tilt(
      disable: true,
      child: Card(
        child: Container(
          height: 40,
          width: 150,
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
      ),
    );
  }
}
