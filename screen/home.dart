import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:my_portfolio/colors.dart';
import 'package:nb_utils/nb_utils.dart';

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: ColorCode.colorList(context).cardColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: context.height() - 88,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Lottie.asset("assets/lottie/lottie5.json",
                          height: 500, width: 500),
                      40.width,
                      Container(
                        height: context.height() - 88,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hi,',
                                textDirection: TextDirection.ltr,
                                style: GoogleFonts.abhayaLibre(
                                  fontSize: 48,
                                ),
                              ),
                              Text(
                                'I\'m Sanoop Das',
                                textDirection: TextDirection.ltr,
                                style: GoogleFonts.abhayaLibre(
                                  fontSize: 48,
                                ),
                              ),
                              Text(
                                'A Software Developer',
                                textDirection: TextDirection.ltr,
                                style: GoogleFonts.abhayaLibre(
                                  fontSize: 48,
                                ),
                              ),
                              80.height,
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Lottie.asset("assets/lottie/lottie5.json",
                          height: 500, width: 500),
                      40.width,
                      Container(
                        height: context.height() - 150,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hi,',
                                textDirection: TextDirection.ltr,
                                style: GoogleFonts.abhayaLibre(
                                  fontSize: 48,
                                ),
                              ),
                              Text(
                                'I\'m Sanoop Das',
                                textDirection: TextDirection.ltr,
                                style: GoogleFonts.abhayaLibre(
                                  fontSize: 48,
                                ),
                              ),
                              Text(
                                'A Flutter Developer',
                                textDirection: TextDirection.ltr,
                                style: GoogleFonts.abhayaLibre(
                                  fontSize: 48,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
