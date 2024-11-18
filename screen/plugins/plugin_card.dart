import 'package:flutter/material.dart';
import 'package:flutter_tilt/flutter_tilt.dart';
import 'package:my_portfolio/colors.dart';
import 'package:my_portfolio/helpers/sddb_helper.dart';
import 'package:my_portfolio/model/widget_build_model.dart';

import 'package:url_launcher/url_launcher.dart';

class PluginCard extends StatelessWidget {
  final WidgetBuildModel model;
  const PluginCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Tilt(
        lightConfig: const LightConfig(color: Color(0xFFbcbcbc)),
        shadowConfig: const ShadowConfig(color: Colors.transparent),
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: 210,
          width: 300,
          decoration: BoxDecoration(color: ColorCode.colorList(context).cardColor, borderRadius: BorderRadius.circular(10)),
          padding: const EdgeInsets.fromLTRB(15, 15, 10, 15),
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
                Text("      ${model.subTitle}"),
                Positioned(
                    left: 7,
                    top: 8,
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 4,
                    ))
              ]),
              20.height,
              Row(
                children: [
                  SizedBox(
                    width: 200,
                    height: 40,
                    child: Wrap(
                      spacing: 5,
                      runSpacing: 5,
                      children: [
                        ...?model.valueList?.map((e) => Container(
                              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black,
                              ),
                              child: Text(
                                e,
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                              ),
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    child: VerticalDivider(
                      color: Colors.white30,
                      width: 10,
                      thickness: .5,
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      child: IconButton(
                        onPressed: () => launchUrl(Uri.parse("${model.value}")),
                        icon: Icon(Icons.link),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
