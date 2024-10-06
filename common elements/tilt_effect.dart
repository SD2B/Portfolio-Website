import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TiltEffect extends HookWidget {
  final Widget child; // The widget you want to wrap with the tilt effect
  final double tiltX; // Optional: how much to tilt on the X-axis
  final double tiltY; // Optional: how much to tilt on the Y-axis
  final Duration duration; // Optional: duration of the tilt animation

  const TiltEffect({
    Key? key,
    required this.child,
    this.tiltX = 0.1,
    this.tiltY = 0.1,
    this.duration = const Duration(milliseconds: 300),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use hook to manage hover state
    final isHovered = useState(false);

    return MouseRegion(
      onEnter: (event) => isHovered.value = true,
      onExit: (event) => isHovered.value = false,
      child: AnimatedContainer(
        duration: duration,
        transform: isHovered.value
            ? (Matrix4.rotationX(tiltX)..rotateY(tiltY)) // Fixed here
            : Matrix4.identity(),
        child: child, // The wrapped widget
      ),
    );
  }
}
