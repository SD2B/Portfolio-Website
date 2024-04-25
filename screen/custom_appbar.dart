import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';

import '../vm/riverpod.dart';

class CustomAppBar extends ConsumerWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
        width: context.width(),
        height: 60,
        child: Row(
          children: [
            20.width,
            Container(
              height: 50,
              width: 50,
              decoration: const BoxDecoration(
                // shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage("assets/images/file.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Text("CodeLife - SD"),
            const Spacer(),
            IconButton(
                onPressed: () {
                  ref.read(mainVM).isLightTheme =
                      !ref.read(mainVM).isLightTheme;
                  ref.read(mainVM).refresh();
                },
                icon: Icon(
                  ref.watch(mainVM).isLightTheme
                      ? Icons.light_mode
                      : Icons.dark_mode,
                )),
            20.width,
            // TextButton(
            //   child: const Text('Home'),
            //   onPressed: () {},
            // ),
            // TextButton(
            //   child: const Text('Skills'),
            //   onPressed: () {},
            // ),
            // TextButton(
            //   child: const Text('Projects'),
            //   onPressed: () {},
            // ),
            // TextButton(
            //   child: const Text('Certifications'),
            //   onPressed: () {},
            // ),
            // TextButton(
            //   child: const Text('Education'),
            //   onPressed: () {},
            // ),
            // TextButton(
            //   child: const Text('Contact'),
            //   onPressed: () {},
            // ),
          ],
        ));
  }
}
