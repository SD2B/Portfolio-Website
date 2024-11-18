import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/common%20elements/in_progress.dart';
import 'package:my_portfolio/helpers/sddb_helper.dart';
import 'package:my_portfolio/screen/contact/contact_section.dart';

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
