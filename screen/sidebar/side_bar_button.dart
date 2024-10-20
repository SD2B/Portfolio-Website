import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hovering/hovering.dart';
import 'package:my_portfolio/vm/riverpod.dart';
import 'package:nb_utils/nb_utils.dart';

class SideBarButton extends ConsumerWidget {
  final String svgl;
  final String svgd;
  final VoidCallback? onTap;
  const SideBarButton({super.key, this.onTap, required this.svgl, required this.svgd});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Card(
            color: ref.watch(mainVM).isLightTheme ? Colors.white : Colors.transparent,
            child: InkWell(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              onTap: onTap,
              child: HoverAnimatedContainer(
                width: 40,
                height: 40,
                hoverHeight: 60,
                hoverWidth: 60,
                hoverDecoration: BoxDecoration(
                  // color: grey.withOpacity(.3),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                padding: const EdgeInsets.all(5),
                child: SvgPicture.asset(
                  ref.watch(mainVM).isLightTheme ? svgl : svgd,
                  color: Color(0xFFcf8e7c),
                  height: 30,
                  width: 30,
                ),
              ),
            )),
        10.height
      ],
    );
  }
}