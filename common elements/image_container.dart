import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ImageContainer extends HookWidget {
  final List<String> imageUrls;
  final Duration duration;
  final BoxFit fit;
  final double? width;
  final double? height;
  final Widget? child;
  final BoxDecoration? decoration;
  final Duration transitionDuration;

  const ImageContainer({
    super.key,
    required this.imageUrls,
    this.duration = const Duration(seconds: 10),
    this.transitionDuration = const Duration(milliseconds: 500),
    this.fit = BoxFit.cover,
    this.width,
    this.height,
    this.child,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    // Hook to manage the current index of the image
    final currentIndex = useState(0);

    // Hook to manage the timer
    useEffect(() {
      final timer = Timer.periodic(duration, (timer) {
        currentIndex.value = (currentIndex.value + 1) % imageUrls.length;
      });

      // Clean up the timer when the widget is disposed
      return timer.cancel;
    }, []);

    // Get the screen size
    final screenSize = MediaQuery.of(context).size;

    // Use full screen size if width or height is not provided
    final containerWidth = width ?? screenSize.width;
    final containerHeight = height ?? screenSize.height;

    // Check if the image is a network or asset image
    ImageProvider imageProvider;
    if (imageUrls[currentIndex.value].startsWith('http')) {
      imageProvider = NetworkImage(imageUrls[currentIndex.value]);
    } else {
      imageProvider = AssetImage(imageUrls[currentIndex.value]);
    }

    return Container(
      width: containerWidth,
      height: containerHeight,
      decoration: decoration,
      child: Stack(
        fit: StackFit.expand,
        children: [
          AnimatedSwitcher(
            duration: transitionDuration,
            switchInCurve: Curves.easeIn,
            switchOutCurve: Curves.easeOut,
            child: Image(
              key: ValueKey<String>(imageUrls[currentIndex.value]),
              image: imageProvider,
              fit: fit,
              width: containerWidth,
              height: containerHeight,
            ),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ),
          if (child != null) child!,
        ],
      ),
    );
  }
}
