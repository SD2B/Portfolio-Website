import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';

class Skills extends ConsumerWidget {
  const Skills({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: context.height() - 88,
      width: context.width() - 88,
    );
  }
}
