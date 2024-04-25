import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class InProgress extends StatelessWidget {
  const InProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Lottie.asset(
          "assets/lottie/inprogress.json",
          height: 300,
          width: 300,
        ),
        Text("Work in Progress", style: Theme.of(context).textTheme.bodyLarge),
      ],
    ));
  }
}
