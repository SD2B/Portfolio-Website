import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tilt/flutter_tilt.dart';
import 'package:hovering/hovering.dart';
import 'package:my_portfolio/colors.dart';
import 'package:my_portfolio/common%20elements/in_progress.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../vm/riverpod.dart';

class Projects extends ConsumerWidget {
  const Projects({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: context.height() - 88,
      width: context.width() - 88,
      child: Column(
        children: [
          const HeaderLabel(
              header: "Projects",
              para: "\"\"I have worked on many projects.\n"
                  " I have experience in developing multiplatform"
                  " softwares like Mobile apps, Web applications,"
                  " Windows Linux and Mac softwares.\n I use Flutter framework as my primary tool.\"\"",
              headFontSize: 40,
              centerAlign: true),
          20.height,
          Wrap(
            spacing: 30,
            runSpacing: 30,
            children: [
              for (int i = 0; i < 5; i++)
                Tilt(
                  lightConfig: LightConfig(color: Colors.yellow),
                  shadowConfig: ShadowConfig(color: transparentColor),
                  borderRadius: BorderRadius.circular(10),
                  child: Card(
                    color: ref.read(mainVM).isHozzoHovered == true ? ColorCode.colorList(context).whiteBlack : ColorCode.colorList(context).whiteBlack,
                    child: InkWell(
                      onTap: () {
                        launchUrl(Uri.parse("https://hozzowash.com/"));
                      },
                      onHover: (value) {
                        ref.read(mainVM).isHozzoHovered = value;
                        ref.read(mainVM).refresh();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: ColorCode.colorList(context).ashWhiteLabel!.withOpacity(.2),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          children: [
                            Container(
                              height: 100,
                              width: 230,
                              decoration: BoxDecoration(
                                image: const DecorationImage(image: AssetImage('assets/images/hozzologo.png'), fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            10.height,
                            const HeaderLabel(
                              header: "Hozzo",
                              headFontSize: 20,
                              subHeader: "No.1 Car Wash App In India",
                              centerAlign: true,
                            ),
                          ],
                        ),
                      )
                          .animate()
                          .fade(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          )
                          .animate()
                          .scale(
                            duration: Duration(milliseconds: 500),
                            curve: ref.watch(mainVM).isHozzoHovered == true ? Curves.easeIn : Curves.easeOut,
                          ),
                    ),
                  ),
                ),
              10.width,
            ],
          )
        ],
      ),
    );
  }
}
