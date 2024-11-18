import 'package:flutter/material.dart';
import 'package:flutter_tilt/flutter_tilt.dart';
import 'package:my_portfolio/colors.dart';
import 'package:my_portfolio/helpers/sddb_helper.dart';
import 'package:my_portfolio/model/widget_build_model.dart';

import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatelessWidget {
  final WidgetBuildModel model;

  const ProjectCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Tilt(
        lightConfig: LightConfig(color: Color(0xFFbcbcbc)),
        shadowConfig: ShadowConfig(color: Colors.transparent),
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 300,
          width: 300,
          decoration: BoxDecoration(color: ColorCode.colorList(context).cardColor, borderRadius: BorderRadius.circular(10)),
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Text(
                  "${model.title}",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
              15.height,
              Stack(children: [
                // ignore: unnecessary_brace_in_string_interps
                Text(
                  "      ${model.subTitle}",
                  textAlign: TextAlign.left,
                ),
                Positioned(
                    left: 7,
                    top: 8,
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 4,
                    ))
              ]),
              20.height,
              Wrap(
                children: [
                  if (model.labelList?.isEmpty == true)
                    TextButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.settings, color: Colors.white),
                      label: Text(
                        "In Progress",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                    ),
                  ...?model.labelList?.map((e) => TextButton.icon(
                        onPressed: () => launchUrl(Uri.parse(model.valueList?[model.labelList?.indexOf(e) ?? 0] ?? "")),
                        icon: Icon(Icons.link, color: Colors.white),
                        label: Text(
                          e,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                              ),
                        ),
                      ))
                ],
              ),
            ],
          ),
        ));
  }
}
