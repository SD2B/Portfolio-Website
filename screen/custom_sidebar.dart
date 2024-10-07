import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_portfolio/screen/sidebar/side_bar_button.dart';
import 'package:nb_utils/nb_utils.dart';

import '../helpers/common_enums.dart';

class CustomSideBar extends StatelessWidget {
  const CustomSideBar({super.key});

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
                  svgl: "assets/svg/plugin.svg",
                  svgd: "assets/svg/plugin.svg",
                  onTap: () {
                    context.goNamed(RouteEnum.plugins.name);
                  }),
              // SideBarButton(
              //   svgl: "assets/svg/edul.svg",
              //   svgd: "assets/svg/edud.svg",
              //   onTap: () {
              //     context.goNamed(RouteEnum.education.name);
              //   },
              // ),
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
