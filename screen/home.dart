import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:my_portfolio/colors.dart';
import 'package:my_portfolio/helpers/respo_helper.dart';
import 'package:my_portfolio/screen/custom_sidebar.dart';
import 'package:my_portfolio/vm/riverpod.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends ConsumerWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: ColorCode.colorList(context).cardColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: context.height() - 88,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RespoHelper.isDesktop(context)
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: context.height() - 200,
                              width: RespoHelper.isDesktop(context) ? 500 : 300,
                              decoration: BoxDecoration(
                                color: ColorCode.colorList(context).cardColor,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                ),
                              ),
                              child: Lottie.asset(
                                "assets/lottie/lottie5.json",
                                height: RespoHelper.isDesktop(context)
                                    ? 500
                                    : RespoHelper.isTablet(context)
                                        ? 300
                                        : 100,
                                width: RespoHelper.isDesktop(context)
                                    ? context.width() - 600
                                    : RespoHelper.isTablet(context)
                                        ? 300
                                        : 100,
                              ),
                            ),
                            // 20.width,
                            SizedBox(
                              height: context.height() - 88,
                              width: RespoHelper.isDesktop(context)
                                  ? context.width() - 830
                                  : 500,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Hi,',
                                    textDirection: TextDirection.ltr,
                                    style: GoogleFonts.abhayaLibre(
                                      fontSize: 48,
                                    ),
                                  ),
                                  Text(
                                    'I\'m Sanoop Das',
                                    textDirection: TextDirection.ltr,
                                    style: GoogleFonts.abhayaLibre(
                                      fontSize: 48,
                                    ),
                                  ),
                                  Text(
                                    'A Software Developer',
                                    textDirection: TextDirection.ltr,
                                    style: GoogleFonts.abhayaLibre(
                                      fontSize: 48,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      SideBarButton(
                                        svgl: "assets/svg/linkedin_light.svg",
                                        svgd: "assets/svg/linkedin_dark.svg",
                                        onTap: () {
                                          launchUrl(Uri.parse(
                                              "https://www.linkedin.com/in/sd2b/"));
                                        },
                                      ),
                                      SideBarButton(
                                        svgl: "assets/svg/githubl.svg",
                                        svgd: "assets/svg/githubd.svg",
                                        onTap: () {
                                          launchUrl(Uri.parse(
                                              "https://github.com/SD2B"));
                                        },
                                      ),
                                      SideBarButton(
                                        svgl: "assets/svg/insta_light.svg",
                                        svgd: "assets/svg/insta_dark.svg",
                                        onTap: () async {
                                          await launchUrl(Uri.parse(
                                              "https://www.instagram.com/s_d__d_b/"));
                                        },
                                      ),
                                      SideBarButton(
                                        svgl: "assets/svg/whatsapp_light.svg",
                                        svgd: "assets/svg/whatsapp_dark.svg",
                                        onTap: () {
                                          launchUrl(Uri.parse(
                                              "https://wa.me/9656595353"));
                                        },
                                      ),
                                    ],
                                  ),
                                  80.height,
                                ],
                              ),
                            ),
                          ],
                        )
                      : Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: context.height() - 88,
                              width: RespoHelper.isDesktop(context)
                                  ? context.width() - 830
                                  : 500,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Hi,',
                                    textDirection: TextDirection.ltr,
                                    style: GoogleFonts.abhayaLibre(
                                      fontSize: 48,
                                    ),
                                  ),
                                  Text(
                                    'I\'m Sanoop Das',
                                    textDirection: TextDirection.ltr,
                                    style: GoogleFonts.abhayaLibre(
                                      fontSize: 48,
                                    ),
                                  ),
                                  Text(
                                    'A Software Developer',
                                    textDirection: TextDirection.ltr,
                                    style: GoogleFonts.abhayaLibre(
                                      fontSize: 48,
                                    ),
                                  ),
                                  80.height,
                                ],
                              ),
                            ),
                          ],
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
