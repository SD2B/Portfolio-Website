import 'package:flutter/material.dart';
import 'package:my_portfolio/colors.dart';
import 'package:my_portfolio/common%20elements/in_progress.dart';
import 'package:my_portfolio/helpers/responsive_helper.dart';
import 'package:my_portfolio/helpers/sddb_helper.dart';
import 'package:my_portfolio/screen/custom_scaffold.dart';
import 'package:timeline_tile/timeline_tile.dart';

class Experience extends StatelessWidget {
  const Experience({super.key});

  @override
  Widget build(BuildContext context) {
    final respo = ResponsiveHelper.isDesktop(context);
    return SizedBox(
      width: respo ? context.width() - 300 : context.width() - 50,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          HeaderLabel(header: "Experience", headFontSize: 40, centerAlign: true),
          20.height,
          TimelineTile(
            isFirst: true,
            alignment: TimelineAlign.manual,
            lineXY: 0.9,
            beforeLineStyle: LineStyle(
              color: Color(0xFFbcbcbc),
              thickness: 6,
            ),
            afterLineStyle: const LineStyle(
              color: Color(0xFFbcbcbc),
              thickness: 6,
            ),
            indicatorStyle: const IndicatorStyle(
              width: 30,
              color: Color(0xFFbcbcbc),
            ),
            startChild: ExperienceCard(
              company: "Screl Info Pvt. Ltd | Kakkancheri, Kerala",
              job: "Flutter Developer",
              dates: "November 2023 - November 2024",
              description: const [
                "Designed and deployed cross-platform applications for Web, Android, iOS, and Windows, leading to a 40% increase in downloads and 15% improvement in user retention.",
                "Collaborated with diverse teams to achieve 100% on-time project delivery, utilizing strong communication and teamwork skills.",
                "Developed maintainable code and conducted thorough code reviews to uphold quality standards.",
                "Contributed to process improvements and engaged in proactive problem-solving to resolve technical issues efficiently.",
              ],
            ),
          ),
          const TimelineDivider(
            begin: 0.1,
            end: 0.9,
            thickness: 6,
            color: Color(0xFFbcbcbc),
          ),
          TimelineTile(
            alignment: TimelineAlign.manual,
            lineXY: 0.1,
            beforeLineStyle: const LineStyle(
              color: Color(0xFFbcbcbc),
              thickness: 6,
            ),
            indicatorStyle: const IndicatorStyle(
              width: 20,
              color: Color(0xFFbcbcbc),
            ),
            endChild: ExperienceCard(
              company: "Ralfiz Technologies | Perinthalmanna, Kerala",
              job: "Flutter Developer Intern",
              dates: "July 2023- November 2023",
              description: const [
                "Gained hands-on experience in Flutter development while contributing to projects for both Indian and international clients.",
                "Worked with the development team to build and deploy high-quality mobile applications.",
                "Built a solid foundation in the Flutter framework and mobile application development through practical, project-based learning.",
                "Participated in all stages of the software development lifecycle, enhancing technical skills and understanding.",
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ExperienceCard extends StatelessWidget {
  final String company;
  final String job;
  final String dates;
  final List<String> description;
  const ExperienceCard({
    super.key,
    required this.company,
    required this.job,
    required this.dates,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color(0xFFbcbcbc)),
        ),
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderLabel(
              header: company,
              subHeader: "👨🏿‍💻 $job\n📅 $dates",
            ),
            10.height,
            ...description.map(
              (e) => Text("▫️ $e"),
            ),
            25.height,
          ],
        ),
      ),
    );
  }
}
