// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/common%20elements/in_progress.dart';
import 'package:my_portfolio/screen/plugins/plugin_card.dart';
import 'package:my_portfolio/screen/plugins/plugin_list.dart';
import 'package:nb_utils/nb_utils.dart';

class Plugins extends ConsumerWidget {
  const Plugins({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: context.height() - 88,
      width: context.width() - 88,
      child: Column(
        children: [
          const HeaderLabel(
              header: "Plugins",
              // para: "\"\"I have worked on many Plugins.\n"
              //     " I have experience in developing multiplatform"
              //     " softwares like Mobile apps, Web applications,"
              //     " Windows Linux and Mac softwares.\n I use Flutter framework as my primary tool.\"\"",
              headFontSize: 40,
              centerAlign: true),
          20.height,
          Container(
            height: context.height() - 270,
            width: context.width() - 88,
            padding: const EdgeInsets.fromLTRB(40, 10, 10, 10),
            child: AnimatedScrollView(
              children: [
                Wrap(
                  spacing: 30,
                  runSpacing: 30,
                  children: [
                    ...PluginList.pluginList.map(
                      (model) => PluginCard(model: model),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
