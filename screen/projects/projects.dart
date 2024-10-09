import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/common%20elements/in_progress.dart';
import 'package:my_portfolio/screen/projects/project_card.dart';
import 'package:my_portfolio/screen/projects/project_list.dart';
import 'package:nb_utils/nb_utils.dart';

class Projects extends ConsumerWidget {
  const Projects({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: context.height() - 88,
      width: context.width() - 88,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
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
            SizedBox(
              height: context.height() - 320,
              child: AnimatedScrollView(
                children: [
                  Wrap(
                    spacing: 30,
                    runSpacing: 30,
                    children: [
                      ...ProjectList.projectList.map(
                        (e) => ProjectCard(model: e),
                      ),
                      10.width,
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
