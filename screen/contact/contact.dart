import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/common%20elements/in_progress.dart';
import 'package:my_portfolio/screen/custom_sidebar.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactMe extends ConsumerWidget {
  const ContactMe({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
        height: context.height() - 88,
        width: context.width() - 88,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const HeaderLabel(
                header: "Contact Me",
                subHeader: "I am available for freelance work",
                headFontSize: 40,
                centerAlign: true,
              ),
              20.height,  
              const ContactSection(),
            ],
          ),
        ));
  }
}

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            SideBarButton(
              svgl: "assets/svg/maill.svg",
              svgd: "assets/svg/maild.svg",
              onTap: () {
                launchUrl(Uri.parse("mailto:msanoopdb1@gmail.com"));
              },
            ),
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
          ],
        ),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            SideBarButton(
              svgl: "assets/svg/insta_light.svg",
              svgd: "assets/svg/insta_dark.svg",
              onTap: () async {
                await launchUrl(
                    Uri.parse("https://www.instagram.com/s_d__d_b/"));
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
      ],
    );
  }
}
