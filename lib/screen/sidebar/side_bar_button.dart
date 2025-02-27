import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hovering/hovering.dart';
import 'package:my_portfolio/helpers/responsive_helper.dart';
import 'package:my_portfolio/helpers/sddb_helper.dart';
import 'package:my_portfolio/vm/riverpod.dart';
import 'package:smart_wrap/smart_wrap.dart';

class SideBarButton extends ConsumerWidget {
  final String label;
  final String svgl;
  final String svgd;
  final VoidCallback? onTap;
  final bool labelOnly;
  const SideBarButton({super.key, this.onTap, required this.svgl, required this.svgd, this.label = "", this.labelOnly = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final respo = ResponsiveHelper.isDesktop(context);

    return SmartWrap(
      type: respo ? WrapType.column : WrapType.row,
      mainAxisSize: MainAxisSize.min,
      children: [
        Card(
            color: ref.watch(mainVM).isLightTheme
                ? Colors.white
                : respo
                    ? Colors.transparent
                    : Colors.black.withOpacity(.2),
            child: InkWell(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              onTap: onTap,
              child: labelOnly
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        label,
                        style: GoogleFonts.abhayaLibre(fontSize: 10),
                      ),
                    )
                  : HoverAnimatedContainer(
                      width: 40,
                      height: 40,
                      hoverHeight: 60,
                      hoverWidth: 60,
                      hoverDecoration: BoxDecoration(
                        // color: grey.withOpacity(.3),
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                      ),
                      padding: const EdgeInsets.all(5),
                      child: SvgPicture.asset(
                        ref.watch(mainVM).isLightTheme ? svgl : svgd,
                        colorFilter: const ColorFilter.mode(
                          Color(0xFFbcbcbc),
                          BlendMode.srcIn,
                        ),
                        height: 30,
                        width: 30,
                      ),
                    ),
            )),
        respo ? 10.height : 5.width,
      ],
    );
  }
}
