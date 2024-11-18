import 'package:flutter/material.dart';
import 'package:my_portfolio/screen/sidebar/side_bar_button.dart';
import 'package:page_flow/page_flow.dart';

class CustomSideBar extends StatelessWidget {
  final MultiPageViewController scrollViewController;

  const CustomSideBar({super.key, required this.scrollViewController});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: MediaQuery.of(context).size.height - 70, // Adjust height dynamically
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SideBarButton(
              svgl: "assets/svg/homel.svg",
              svgd: "assets/svg/homed.svg",
              onTap: () {
                scrollViewController.jumpToSection("0");
              },
            ),
            SideBarButton(
              svgl: "assets/svg/skilll.svg",
              svgd: "assets/svg/skilld.svg",
              onTap: () {
                scrollViewController.jumpToSection("1");
              },
            ),
            SideBarButton(
              svgl: "assets/svg/projectl.svg",
              svgd: "assets/svg/projectd.svg",
              onTap: () {
                scrollViewController.jumpToSection("2");
              },
            ),
            SideBarButton(
              svgl: "assets/svg/plugin.svg",
              svgd: "assets/svg/plugin.svg",
              onTap: () {
                scrollViewController.jumpToSection("3");
              },
            ),
            SideBarButton(
              svgl: "assets/svg/contactl.svg",
              svgd: "assets/svg/contactd.svg",
              onTap: () {
                scrollViewController.jumpToSection("4");
              },
            ),
          ],
        ),
      ),
    );
  }
}
