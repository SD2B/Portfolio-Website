import 'package:flutter/material.dart';
import 'package:flutter_tilt/flutter_tilt.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:metaballs/metaballs.dart';
import 'package:my_portfolio/common%20elements/particle_background.dart';
import 'package:my_portfolio/helpers/responsive_helper.dart';
import 'package:my_portfolio/screen/sidebar/side_bar_button.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends HookConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: 600,
      height: 600,
      decoration: const BoxDecoration(
        // color: Colors.black,
        // color: ColorCode.colorList(context).cardColor,
        borderRadius: BorderRadius.only(
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
                ResponsiveHelper.isDesktop(context)
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const HomePageProfileImage(),
                          50.width,
                          Expanded(
                            child: SizedBox(
                              height: context.height() - 88,
                              width: ResponsiveHelper.isDesktop(context) ? context.width() - 830 : 500,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Hi',
                                    textDirection: TextDirection.ltr,
                                    style: GoogleFonts.abhayaLibre(fontSize: 48),
                                  ),
                                  Text(
                                    'I\'m Sanoop Das',
                                    textDirection: TextDirection.ltr,
                                    style: GoogleFonts.abhayaLibre(fontSize: 48),
                                  ),
                                  Text(
                                    'A Software Developer',
                                    textDirection: TextDirection.ltr,
                                    style: GoogleFonts.abhayaLibre(fontSize: 48),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      SideBarButton(
                                        svgl: "assets/svg/linkedin_light.svg",
                                        svgd: "assets/svg/linkedin_dark.svg",
                                        onTap: () {
                                          launchUrl(Uri.parse("https://www.linkedin.com/in/sd2b/"));
                                        },
                                      ),
                                      SideBarButton(
                                        svgl: "assets/svg/githubl.svg",
                                        svgd: "assets/svg/githubd.svg",
                                        onTap: () {
                                          launchUrl(Uri.parse("https://github.com/SD2B"));
                                        },
                                      ),
                                      SideBarButton(
                                        svgl: "assets/svg/insta_light.svg",
                                        svgd: "assets/svg/insta_dark.svg",
                                        onTap: () async {
                                          await launchUrl(Uri.parse("https://www.instagram.com/s_d__d_b/"));
                                        },
                                      ),
                                      SideBarButton(
                                        svgl: "assets/svg/whatsapp_light.svg",
                                        svgd: "assets/svg/whatsapp_dark.svg",
                                        onTap: () {
                                          launchUrl(Uri.parse("https://wa.me/9656595353"));
                                        },
                                      ),
                                    ],
                                  ),
                                  80.height,
                                ],
                              ),
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
                            width: ResponsiveHelper.isDesktop(context) ? context.width() - 830 : 500,
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
    );
  }
}

class HomePageProfileImage extends StatelessWidget {
  const HomePageProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width() / 2.2,
      height: context.height() - 190,
      child: Center(
        child: Stack(
          children: [
            Tilt(
              borderRadius: BorderRadius.circular(500),
              lightConfig: const LightConfig(color: Colors.transparent),
              shadowConfig: const ShadowConfig(color: transparentColor),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(500),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(0, 4),
                      blurRadius: 50,
                      spreadRadius: 50,
                    ),
                  ],
                ),
                child: Card(
                  elevation: 9,
                  shadowColor: Colors.black.withOpacity(0.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(500),
                  ),
                  child: const CircleAvatar(
                    backgroundColor: Colors.black,
                    backgroundImage: AssetImage("assets/images/myPic2.webp"),
                    radius: 200,
                  ),
                ),
              ),
            ),
            // CircleAvatar(
            //   backgroundColor: Colors.black.withOpacity(.4),
            //   radius: 200,
            // ),
          ],
        ),
      ),
    );
  }
}
