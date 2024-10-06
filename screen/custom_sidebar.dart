import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hovering/hovering.dart';
import 'package:my_portfolio/vm/riverpod.dart';
import 'package:nb_utils/nb_utils.dart';

import '../colors.dart';
import '../helpers/common_enums.dart';

class CustomSideBar extends StatelessWidget {
  const CustomSideBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 60,
        height: context.height() - 70,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SideBarButton(
                  svgl: "assets/svg/homel.svg",
                  svgd: "assets/svg/homed.svg",
                  onTap: () {
                    context.go("/");
                  }),
              SideBarButton(
                  svgl: "assets/svg/skilll.svg",
                  svgd: "assets/svg/skilld.svg",
                  onTap: () {
                    context.goNamed(RouteEnum.skills.name);
                  }),
              SideBarButton(
                  svgl: "assets/svg/projectl.svg",
                  svgd: "assets/svg/projectd.svg",
                  onTap: () {
                    context.goNamed(RouteEnum.project.name);
                  }),
              SideBarButton(
                svgl: "assets/svg/edul.svg",
                svgd: "assets/svg/edud.svg",
                onTap: () {
                  context.goNamed(RouteEnum.education.name);
                },
              ),
              SideBarButton(
                svgl: "assets/svg/contactl.svg",
                svgd: "assets/svg/contactd.svg",
                onTap: () {
                  context.goNamed(RouteEnum.contact.name);
                },
              ),
            ],
          ),
        ));
  }
}

class SideBarButton extends ConsumerWidget {
  // final IconData icon;
  final String svgl;
  final String svgd;
  final VoidCallback? onTap;
  const SideBarButton({super.key, this.onTap, required this.svgl, required this.svgd});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Card(
            color: ColorCode.colorList(context).whiteBlack,
            child: InkWell(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              onTap: onTap,
              child: HoverAnimatedContainer(
                width: 40,
                height: 40,
                hoverHeight: 60,
                hoverWidth: 60,
                hoverDecoration: BoxDecoration(
                  color: grey.withOpacity(.3),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                padding: const EdgeInsets.all(5),
                child: SvgPicture.asset(
                  ref.watch(mainVM).isLightTheme ? svgl : svgd,
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
