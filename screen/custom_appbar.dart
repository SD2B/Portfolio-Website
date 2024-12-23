import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/helpers/sddb_helper.dart';

class CustomAppBar extends ConsumerWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
        width: context.width(),
        height: 60,
        child: Row(
          children: const [
            // 20.width,
            // Container(
            //   height: 50,
            //   width: 50,
            //   decoration: const BoxDecoration(
            //     // shape: BoxShape.circle,
            //     image: DecorationImage(
            //       image: AssetImage("assets/images/file.png"),
            //       fit: BoxFit.cover,
            //     ),
            //   ),
            // ),
            // Text(
            //   "Sanoop Das",
            //   style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            //         color: ColorCode.colorList(context).blackWhite,
            //         fontWeight: FontWeight.bold,
            //         fontSize: 20,
            //         fontFamily: "inter",
            //       ),
            // ),
            Spacer(),
            // IconButton(
            //     onPressed: () {
            //       ref.read(mainVM).isLightTheme =
            //           !ref.read(mainVM).isLightTheme;
            //       ref.read(mainVM).refresh();
            //     },
            //     icon: Icon(
            //       ref.watch(mainVM).isLightTheme
            //           ? Icons.light_mode
            //           : Icons.dark_mode,
            //     )),
            // 20.width,
          ],
        ));
  }
}
