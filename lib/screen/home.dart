import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tilt/flutter_tilt.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/common%20elements/speak_button.dart';
import 'package:my_portfolio/helpers/responsive_helper.dart';
import 'package:my_portfolio/helpers/sddb_helper.dart';
import 'package:my_portfolio/screen/sidebar/side_bar_button.dart';
import 'package:my_portfolio/vm/riverpod.dart';
import 'package:smart_wrap/smart_expand.dart';
import 'package:smart_wrap/smart_wrap.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeMainSection extends ConsumerWidget {
  const HomeMainSection({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final respo = ResponsiveHelper.isDesktop(context);
    final vm = ref.watch(mainVM);
    vm.toggleBoolStream();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SmartWrap(
          type: respo ? WrapType.row : WrapType.column,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (!respo) 100.height,
            const HomePageProfileImage(),
            50.width,
            SmartExpand(
              disableExpand: respo,
              child: SizedBox(
                // height: context.height() - 88,
                width: respo ? context.width() - 830 : context.width() - 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: respo ? CrossAxisAlignment.start : CrossAxisAlignment.center,
                  children: [
                    20.height,
                    Text(
                      respo ? 'Hi,' : 'Hi',
                      textDirection: TextDirection.ltr,
                      style: GoogleFonts.abhayaLibre(
                        fontSize: 65,
                      ),
                    ),
                    Text(
                      'I\'m Sanoop Das',
                      textDirection: TextDirection.ltr,
                      style: GoogleFonts.abhayaLibre(fontSize: respo ? 48 : 40),
                    ),
                    if (respo)
                      StreamBuilder(
                        stream: vm.toggleBoolStream(),
                        builder: (context, snapshot) => snapshot.data == true
                            ? Text(
                                'A Flutter Developer',
                                textDirection: TextDirection.ltr,
                                style: GoogleFonts.abhayaLibre(fontSize: respo ? 48 : 40),
                              ).animate().fade(duration: Duration(milliseconds: 500))
                            : Text(
                                'A Software Developer',
                                textDirection: TextDirection.ltr,
                                style: GoogleFonts.abhayaLibre(fontSize: respo ? 48 : 40),
                              ).animate().fadeIn(duration: Duration(milliseconds: 500)),
                      ),
                    if (!respo) ...[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'A ',
                            textDirection: TextDirection.ltr,
                            style: GoogleFonts.abhayaLibre(fontSize: respo ? 48 : 40),
                          ),
                          StreamBuilder(
                            stream: vm.toggleBoolStream(),
                            builder: (context, snapshot) => Text(
                              snapshot.data == true ? 'Flutter' : 'Software',
                              textDirection: TextDirection.ltr,
                              style: GoogleFonts.abhayaLibre(fontSize: respo ? 48 : 40),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Developer',
                        textDirection: TextDirection.ltr,
                        style: GoogleFonts.abhayaLibre(fontSize: respo ? 48 : 40),
                      )
                    ],
                    Row(
                      mainAxisAlignment: respo ? MainAxisAlignment.start : MainAxisAlignment.center,
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
                            launchUrl(Uri.parse("https://drive.google.com/file/d/15dQfEQViFisNB095sYqn11IZUd1RfN13/view?usp=sharing"));
                          },
                        ),
                      ],
                    ),
                    respo ? 80.height : 10.height,
                  ],
                ),
              ),
            ),
          ],
        ),
        40.height,
        // SpeakButton(),
        SizedBox(
          width: respo ? context.width() - 400 : context.width() - 80,
          child: Text(
            "⚪   "
            'My name is Sanoop Das, and I am from Malappuram, Kerala. I am a Flutter developer focused on creating '
            'multiplatform applications with seamless functionality and user-friendly design. Proficient in Flutter and Dart, '
            'I develop solutions for Web, Android, iOS, Windows, macOS, and Linux, always prioritizing the user experience. '
            'I am committed to continuously improving my skills and contributing to meaningful projects.\n\n'
            'After completing my Bachelor’s degree in Computer Science, I pursued a Master’s degree in Computer Applications, '
            'which gave me a solid foundation in programming and application development.\n\n'
            'I started my professional journey with an internship at Ralfiz Technologies, where I gained hands-on experience '
            'working on projects for Indian and international clients. This role helped me understand the nuances of developing '
            'high-quality applications. Later, I joined Screl Info Pvt. Ltd. as a Flutter Developer, where I contributed to '
            'several cross-platform projects, improving user engagement and ensuring timely delivery of applications.\n\n'
            'Currently, I am a freelance Flutter developer, working on a variety of projects that allow me to explore innovative '
            'solutions. My most notable works include:\n'
            '- ISSELO: A restaurant management and POS software offering robust offline and online syncing features for uninterrupted service.\n'
            '- Hozzo: India’s leading car wash application, where I introduced water-saving features, reducing usage by 40%.\n\n'
            'In addition to my professional work, I actively contribute to the Flutter community by publishing tools like '
            'SmartTip and SmartWrap on pub.dev, helping developers create flexible and customizable UI components.\n\n'
            'When I’m not coding, I enjoy spending time with dogs and birds, playing video games, and exploring new technologies. '
            'I am fluent in English, Malayalam, Hindi, and Tamil, which enables me to connect with people from different backgrounds.\n\n'
            'I am now seeking a permanent role in a reputable company where I can contribute to impactful projects and continue to grow as a developer.',
            style: GoogleFonts.abhayaLibre(
              fontSize: 24,
              letterSpacing: respo ? null : 0,
            ),
            textAlign: respo ? null : TextAlign.justify,
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
    final respo = ResponsiveHelper.isDesktop(context);

    return SizedBox(
      width: respo ? context.width() / 2.2 : 200,
      height: respo ? context.height() - 190 : 200,
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
