// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/common%20elements/in_progress.dart';
import 'package:my_portfolio/helpers/sddb_helper.dart';
import 'package:my_portfolio/screen/chrome_extensions/extension_card.dart';
import 'package:my_portfolio/screen/chrome_extensions/extension_list.dart';
import 'package:my_portfolio/screen/plugins/plugin_card.dart';
import 'package:my_portfolio/screen/plugins/plugin_list.dart';

class Extensions extends ConsumerWidget {
  const Extensions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: context.width() - 88,
      child: Padding(
 padding: const EdgeInsets.only(left: 20.0),        child: Column(
          children: [
            const HeaderLabel(
                header: "Chorme Extensions",
                // para: "\"\"I have worked on many Plugins.\n"
                //     " I have experience in developing multiplatform"
                //     " softwares like Mobile apps, Web applications,"
                //     " Windows Linux and Mac softwares.\n I use Flutter framework as my primary tool.\"\"",
                headFontSize: 40,
                centerAlign: true),
            20.height,
            Wrap(
              spacing: 30,
              runSpacing: 30,
              children: [
                ...ExtensionList.extensionList.map(
                  (model) => ExtensionCard(model: model),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
