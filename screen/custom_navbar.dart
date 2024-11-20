import 'package:flutter/material.dart';
import 'package:my_portfolio/helpers/responsive_helper.dart';
import 'package:my_portfolio/helpers/sddb_helper.dart';
import 'package:my_portfolio/screen/sidebar/side_bar_button.dart';
import 'package:page_flow/page_flow.dart';
import 'package:smart_wrap/smart_wrap.dart';

class CustomNavBar extends StatelessWidget {
  final MultiPageViewController scrollViewController;

  const CustomNavBar({super.key, required this.scrollViewController});

  @override
  Widget build(BuildContext context) {
    final respo = ResponsiveHelper.isDesktop(context);

    return Container(
      decoration: BoxDecoration(
        color: respo ? Colors.transparent : Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: respo ? Colors.transparent : Colors.white.withOpacity(.2),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: respo ? EdgeInsets.zero : EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        width: respo ? 60 : null,
        height: respo ? context.height() - 70 : null, // Adjust height dynamically
        child: Center(
          child: SmartWrap(
            type: respo ? WrapType.column : WrapType.row,
            mainAxisAlignment: respo ? MainAxisAlignment.center : MainAxisAlignment.end,
            children: [
              SideBarButton(
                labelOnly: !respo,
                label: "Home",
                svgl: "assets/svg/homel.svg",
                svgd: "assets/svg/homed.svg",
                onTap: () {
                  scrollViewController.jumpToSection("0");
                },
              ),
              SideBarButton(
                labelOnly: !respo,
                label: "Skills",
                svgl: "assets/svg/skilll.svg",
                svgd: "assets/svg/skilld.svg",
                onTap: () {
                  scrollViewController.jumpToSection("1");
                },
              ),
              SideBarButton(
                labelOnly: !respo,
                label: "Experience",
                svgl: "assets/svg/exp.svg",
                svgd: "assets/svg/exp.svg",
                onTap: () {
                  scrollViewController.jumpToSection("2");
                },
              ),
              SideBarButton(
                labelOnly: !respo,
                label: "Projects",
                svgl: "assets/svg/projectl.svg",
                svgd: "assets/svg/projectd.svg",
                onTap: () {
                  scrollViewController.jumpToSection("3");
                },
              ),
              if (respo)
                SideBarButton(
                  labelOnly: !respo,
                  label: "Plugins",
                  svgl: "assets/svg/plugin.svg",
                  svgd: "assets/svg/plugin.svg",
                  onTap: () {
                    scrollViewController.jumpToSection("4");
                  },
                ),
              SideBarButton(
                labelOnly: !respo,
                label: "Contact Me",
                svgl: "assets/svg/contactl.svg",
                svgd: "assets/svg/contactd.svg",
                onTap: () {
                  scrollViewController.jumpToSection("5");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
