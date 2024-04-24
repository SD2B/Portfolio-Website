import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hovering/hovering.dart';
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
                  icon: Icons.home,
                  onTap: () {
                    context.go("/");
                  }),
              SideBarButton(
                  icon: Icons.code,
                  onTap: () {
                    context.goNamed(RouteEnum.skills.name);
                  }),
              SideBarButton(icon: Icons.checklist_outlined, onTap: () {}),
              SideBarButton(icon: Icons.book, onTap: () {}),
              SideBarButton(icon: Icons.call_end_rounded, onTap: () {}),
            ],
          ),
        ));
  }
}

class SideBarButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;
  const SideBarButton({super.key, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
            color: ColorCode.colorList(context).cardColor,
            child: InkWell(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              onTap: onTap,
              child: HoverAnimatedContainer(
                width: 40,
                height: 40,
                hoverHeight: 50,
                hoverWidth: 50,
                child: Icon(icon),
              ),
            )),
        10.height
      ],
    );
  }
}
