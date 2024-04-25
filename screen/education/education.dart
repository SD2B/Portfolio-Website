import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/common%20elements/in_progress.dart';
import 'package:nb_utils/nb_utils.dart';

class Education extends ConsumerWidget {
  const Education({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: context.height() - 88,
      width: context.width() - 88,
      child: const InProgress(),
    );
  }
}
