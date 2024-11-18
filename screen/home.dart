import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_tilt/flutter_tilt.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/common%20elements/in_progress.dart';
import 'package:my_portfolio/helpers/responsive_helper.dart';
import 'package:my_portfolio/helpers/sddb_helper.dart';
import 'package:my_portfolio/screen/sidebar/side_bar_button.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeMainSection extends StatelessWidget {
  const HomeMainSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
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
                    20.height,
                    Text(
                      'Hi,',
                      textDirection: TextDirection.ltr,
                      style: GoogleFonts.abhayaLibre(
                        fontSize: 65,
                        color: const Color(0xFFbcbcbc),
                      ),
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
                        SideBarButton(
                          svgl: "assets/svg/resume.svg",
                          svgd: "assets/svg/resume.svg",
                          onTap: () {
                            launchUrl(Uri.parse("https://drive.google.com/file/d/1l1EmPs7mLoccS_V6e7RRpBrg-fSZaRqP/view?usp=sharing"));
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
        ),
        SizedBox(
          width: context.width() - 400,
          child: Text(
            "⚪   I am a Flutter developer focused on creating multiplatform applications with seamless functionality and user-friendly design. Proficient in Flutter and Dart, I develop solutions for Web, Android, iOS, Windows, macOS, and Linux, always prioritizing the user experience. I am committed to continuously improving my skills and contributing to meaningful projects.",
            style: GoogleFonts.abhayaLibre(fontSize: 24),
          ),
        ),
      ],
    );
  }
}

class ScrollArrowButton extends HookWidget {
  const ScrollArrowButton({
    super.key,
    required Animation<Offset> animation,
    required this.isAtBottom,
  }) : _animation = animation;

  final Animation<Offset> _animation;
  final ValueNotifier<bool> isAtBottom;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Container(
        decoration: BoxDecoration(color: const Color(0xFFbcbcbc), borderRadius: BorderRadius.circular(100)),
        padding: const EdgeInsets.all(8),
        child: Icon(
          isAtBottom.value == true ? Icons.arrow_upward_rounded : Icons.arrow_downward_rounded,
          color: Colors.black,
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
              shadowConfig: const ShadowConfig(color: Colors.transparent),
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
                    backgroundImage: AssetImage("assets/images/newprofile.webp"),
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
