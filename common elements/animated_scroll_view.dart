// ignore_for_file: constant_identifier_names, library_private_types_in_public_api

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';


class AnimatedScrollView extends StatefulWidget {
  /// ListView.builder properties
  final ScrollController? controller;
  final List<Widget> children;
  final EdgeInsetsGeometry? padding;
  final ScrollPhysics? physics;
  final Clip clipBehavior;
  final DragStartBehavior dragStartBehavior;
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;
  final bool? primary;
  final String? restorationId;
  final bool reverse;

  /// Animation Configuration
  final ListAnimationType listAnimationType;

  final SlideConfiguration? slideConfiguration;
  final FadeInConfiguration? fadeInConfiguration;
  final ScaleConfiguration? scaleConfiguration;
  final FlipConfiguration? flipConfiguration;

  final VoidCallback? onNextPage;
  final VoidCallback? onPageScrollChange;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;

  final RefreshCallback? onSwipeRefresh;
  final bool disposeScrollController;
  final Color? refreshIndicatorColor;

  const AnimatedScrollView({
    super.key,
    this.controller,
    this.padding,
    this.physics,
    this.clipBehavior = Clip.hardEdge,
    this.dragStartBehavior = DragStartBehavior.start,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
    this.primary,
    this.restorationId,
    this.reverse = false,
    required this.children,
    this.listAnimationType = ListAnimationType.Slide,
    this.slideConfiguration,
    this.fadeInConfiguration,
    this.scaleConfiguration,
    this.flipConfiguration,
    this.onNextPage,
    this.onPageScrollChange,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.onSwipeRefresh,
    this.disposeScrollController = true,
    this.refreshIndicatorColor,
  });

  @override
  State<AnimatedScrollView> createState() => _AnimatedScrollViewState();
}

class _AnimatedScrollViewState extends State<AnimatedScrollView> {
  ScrollController? scrollController;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    if (widget.controller != null) {
      scrollController = widget.controller;
    } else {
      scrollController = ScrollController();
    }

    if (widget.onNextPage != null) {
      /// Enable Pagination

      scrollController!.addListener(() {
        if (scrollController!.position.maxScrollExtent ==
            scrollController!.offset) {
          widget.onNextPage?.call();
        }

        widget.onPageScrollChange?.call();
      });
    }
  }

  @override
  void dispose() {
    super.dispose();

    if (widget.disposeScrollController) scrollController?.dispose();
  }

  Widget _widget() {
    return AnimationLimiterWidget(
      child: SingleChildScrollView(
        controller: scrollController,
        physics: widget.physics,
        padding: widget.padding,
        scrollDirection: Axis.vertical,
        clipBehavior: widget.clipBehavior,
        dragStartBehavior: widget.dragStartBehavior,
        keyboardDismissBehavior: widget.keyboardDismissBehavior,
        primary: widget.primary,
        restorationId: widget.restorationId,
        reverse: widget.reverse,
        child: Column(
          mainAxisSize: widget.mainAxisSize,
          crossAxisAlignment: widget.crossAxisAlignment,
          children: List.generate(widget.children.length, (index) {
            return AnimationConfigurationClass.staggeredList(
              position: index,
              child: AnimatedItemWidget(
                listAnimationType: widget.listAnimationType,
                fadeInConfiguration: widget.fadeInConfiguration,
                scaleConfiguration: widget.scaleConfiguration,
                slideConfiguration: widget.slideConfiguration,
                flipConfiguration: widget.flipConfiguration,
                child: widget.children[index],
              ),
            );
          }),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.onSwipeRefresh != null) {
      return RefreshIndicator(
        onRefresh: widget.onSwipeRefresh!,
        color: widget.refreshIndicatorColor,
        child: _widget(),
      );
    } else {
      return _widget();
    }
  }
}




enum ListAnimationType { None, FadeIn, Scale, Slide, Flip }

const defaultAnimationDuration = Duration(milliseconds: 500);
const defaultAnimationDelay = Duration(milliseconds: 50);

class AnimatedItemWidget extends StatelessWidget {
  final ListAnimationType listAnimationType;
  final Widget child;

  final SlideConfiguration? slideConfiguration;
  final FadeInConfiguration? fadeInConfiguration;
  final ScaleConfiguration? scaleConfiguration;
  final FlipConfiguration? flipConfiguration;

  AnimatedItemWidget({
    super.key,
    required this.child,
    this.listAnimationType = ListAnimationType.Slide,
    SlideConfiguration? slideConfiguration,
    FadeInConfiguration? fadeInConfiguration,
    ScaleConfiguration? scaleConfiguration,
    FlipConfiguration? flipConfiguration,
  })  : slideConfiguration = slideConfiguration ?? SlideConfiguration(),
        fadeInConfiguration = fadeInConfiguration ?? FadeInConfiguration(),
        scaleConfiguration = scaleConfiguration ?? ScaleConfiguration(),
        flipConfiguration = flipConfiguration ?? FlipConfiguration();

  @override
  Widget build(BuildContext context) {
    if (listAnimationType == ListAnimationType.FadeIn) {
      return FadeInAnimationWidget(
        duration: fadeInConfiguration!.duration,
        curve: fadeInConfiguration!.curve,
        delay: fadeInConfiguration!.delay,
        child: child,
      );
    } else if (listAnimationType == ListAnimationType.Flip) {
      return FadeInAnimationWidget(
        delay: flipConfiguration!.delay,
        curve: flipConfiguration!.curve,
        duration: flipConfiguration!.duration,
        child: FlipAnimationWidget(
          delay: flipConfiguration!.delay,
          curve: flipConfiguration!.curve,
          duration: flipConfiguration!.duration,
          flipAxis: flipConfiguration!.flipAxis,
          child: child,
        ),
      );
    } else if (listAnimationType == ListAnimationType.Slide) {
      return FadeInAnimationWidget(
        delay: slideConfiguration!.delay,
        curve: slideConfiguration!.curve,
        duration: slideConfiguration!.duration,
        child: SlideAnimationWidget(
          delay: slideConfiguration!.delay,
          curve: slideConfiguration!.curve,
          duration: slideConfiguration!.duration,
          horizontalOffset: slideConfiguration!.horizontalOffset,
          verticalOffset: slideConfiguration!.verticalOffset,
          child: child,
        ),
      );
    } else if (listAnimationType == ListAnimationType.Scale) {
      return FadeInAnimationWidget(
        delay: scaleConfiguration!.delay,
        curve: scaleConfiguration!.curve,
        duration: scaleConfiguration!.duration,
        child: ScaleAnimationWidget(
          delay: scaleConfiguration!.delay,
          curve: scaleConfiguration!.curve,
          duration: scaleConfiguration!.duration,
          scale: scaleConfiguration!.scale,
          child: child,
        ),
      );
    } else {
      return child;
    }
  }
}

class FadeInConfiguration {
  final Duration? duration;
  final Duration? delay;
  final Curve curve;

  FadeInConfiguration({
    this.duration = defaultAnimationDuration,
    this.delay = defaultAnimationDelay,
    this.curve = Curves.easeOutQuart,
  });
}

class ScaleConfiguration {
  final Duration? duration;
  final Duration? delay;
  final Curve curve;
  final double scale;

  ScaleConfiguration({
    this.duration = const Duration(milliseconds: 400),
    this.delay = defaultAnimationDelay,
    this.curve = Curves.ease,
    this.scale = 0.0,
  });
}

class SlideConfiguration {
  final Duration? duration;
  final Duration? delay;
  final Curve curve;
  final double? verticalOffset;
  final double? horizontalOffset;

  SlideConfiguration({
    this.duration = defaultAnimationDuration,
    this.delay = defaultAnimationDelay,
    this.curve = Curves.easeOutQuart,
    this.verticalOffset = 100.0,
    this.horizontalOffset = 0.0,
  });
}

class FlipConfiguration {
  final Duration? duration;
  final Duration? delay;
  final Curve curve;
  final FlipAxisClass flipAxis;

  FlipConfiguration({
    this.duration = defaultAnimationDuration,
    this.delay = defaultAnimationDelay,
    this.curve = Curves.easeOutQuart,
    this.flipAxis = FlipAxisClass.x,
  });
}

//region flutter_staggered_animation library
/// In the context of a scrollable view, your children's animations are only built
/// as the user scrolls and they appear on the screen.
///
/// This create a situation
/// where your animations will be run as you scroll through the content.
///
/// If this is not a behaviour you want in your app, you can use AnimationLimiter.
///
/// AnimationLimiter is an InheritedWidget that prevents the children widgets to be
/// animated if they don't appear in the first frame where AnimationLimiter is built.
///
/// To be effective, AnimationLimiter musts be a direct parent of your scrollable list of widgets.
class AnimationLimiterWidget extends StatefulWidget {
  /// The child Widget to animate.
  final Widget child;

  /// Creates an [AnimationLimiterWidget] that will prevents the children widgets to be
  /// animated if they don't appear in the first frame where AnimationLimiter is built.
  ///
  /// The [child] argument must not be null.
  const AnimationLimiterWidget({
    super.key,
    required this.child,
  });

  @override
  _AnimationLimiterWidgetState createState() => _AnimationLimiterWidgetState();

  static bool? shouldRunAnimation(BuildContext context) {
    return _AnimationLimiterProviderClass.of(context)?.shouldRunAnimation;
  }
}

class _AnimationLimiterWidgetState extends State<AnimationLimiterWidget> {
  bool _shouldRunAnimation = true;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((Duration value) {
      if (!mounted) return;
      setState(() {
        _shouldRunAnimation = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _AnimationLimiterProviderClass(
      shouldRunAnimation: _shouldRunAnimation,
      child: widget.child,
    );
  }
}

class _AnimationLimiterProviderClass extends InheritedWidget {
  final bool? shouldRunAnimation;

  const _AnimationLimiterProviderClass({
    this.shouldRunAnimation,
    required super.child,
  });

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return false;
  }

  static _AnimationLimiterProviderClass? of(BuildContext context) {
    return context
        .findAncestorWidgetOfExactType<_AnimationLimiterProviderClass>();
  }
}

/// [AnimationConfigurationClass] provides the configuration used as a base for every children Animation.
/// Configuration made in [AnimationConfigurationClass] can be overridden in Animation children if needed.
///
/// Depending on the scenario in which you will present your animations,
/// you should use one of [AnimationConfigurationClass]'s named constructors.
///
/// [AnimationConfigurationClass.synchronized] if you want to launch all the children's animations at the same time.
///
/// [AnimationConfigurationClass.staggeredList] if you want to delay the animation of each child
/// to produce a single-axis staggered animations (from top to bottom or from left to right).
///
/// [AnimationConfigurationClass.staggeredGrid] if you want to delay the animation of each child
/// to produce a dual-axis staggered animations (from left to right and top to bottom).
class AnimationConfigurationClass extends InheritedWidget {
  /// Index used as a factor to calculate the delay of each child's animation.
  final int position;

  /// The duration of each child's animation.
  final Duration duration;

  /// The delay between the beginning of two children's animations.
  final Duration? delay;

  /// The column count of the grid
  final int columnCount;

  /// Configure the children's animation to be synchronized (all the children's animation start at the same time).
  ///
  /// Default value for [duration] is 225ms.
  ///
  /// The [child] argument must not be null.
  const AnimationConfigurationClass.synchronized({
    super.key,
    this.duration = const Duration(milliseconds: 225),
    required super.child,
  })  : position = 0,
        delay = Duration.zero,
        columnCount = 1;

  /// Configure the children's animation to be staggered.
  ///
  /// A staggered animation consists of sequential or overlapping animations.
  ///
  /// Each child animation will start with a delay based on its position comparing to previous children.
  ///
  /// The staggering effect will be based on a single axis (from top to bottom or from left to right).
  ///
  /// Use this named constructor to display a staggered animation on a single-axis list of widgets
  /// ([ListView], [ScrollView], [Column], [Row]...).
  ///
  /// The [position] argument must not be null.
  ///
  /// Default value for [duration] is 225ms.
  ///
  /// Default value for [delay] is the [duration] divided by 6
  /// (appropriate factor to keep coherence during the animation).
  ///
  /// The [child] argument must not be null.
  const AnimationConfigurationClass.staggeredList({
    super.key,
    required this.position,
    this.duration = const Duration(milliseconds: 225),
    this.delay,
    required super.child,
  })  : columnCount = 1;

  /// Configure the children's animation to be staggered.
  ///
  /// A staggered animation consists of sequential or overlapping animations.
  ///
  /// Each child animation will start with a delay based on its position comparing to previous children.
  ///
  /// The staggering effect will be based on a dual-axis (from left to right and top to bottom).
  ///
  /// Use this named constructor to display a staggered animation on a dual-axis list of widgets
  /// ([GridView]...).
  ///
  /// The [position] argument must not be null.
  ///
  /// Default value for [duration] is 225ms.
  ///
  /// Default value for [delay] is the [duration] divided by 6
  /// (appropriate factor to keep coherence during the animation).
  ///
  /// The [columnCount] argument must not be null and must be greater than 0.
  ///
  /// The [child] argument must not be null.
  const AnimationConfigurationClass.staggeredGrid({
    super.key,
    required this.position,
    this.duration = const Duration(milliseconds: 225),
    this.delay,
    required this.columnCount,
    required super.child,
  });

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return false;
  }

  /// Helper method to apply a staggered animation to the children of a [Column] or [Row].
  ///
  /// It maps every child with an index and calls
  /// [AnimationConfigurationClass.staggeredList] constructor under the hood.
  ///
  /// Default value for [duration] is 225ms.
  ///
  /// Default value for [delay] is the [duration] divided by 6
  /// (appropriate factor to keep coherence during the animation).
  ///
  /// The [childAnimationBuilder] is a function that will be applied to each child you provide in [children]
  ///
  /// The following is an example of a [childAnimationBuilder] you could provide:
  ///
  /// ```dart
  /// (widget) => SlideAnimation(
  ///   horizontalOffset: 50.0,
  ///   child: FadeInAnimation(
  ///     child: widget,
  ///   ),
  /// )
  /// ```
  ///
  /// The [children] argument must not be null.
  /// It corresponds to the children you would normally have passed to the [Column] or [Row].
  static List<Widget> toStaggeredList({
    Duration? duration,
    Duration? delay,
    required Widget Function(Widget) childAnimationBuilder,
    required List<Widget> children,
  }) =>
      children
          .asMap()
          .map((index, widget) {
            return MapEntry(
              index,
              AnimationConfigurationClass.staggeredList(
                position: index,
                duration: duration ?? const Duration(milliseconds: 225),
                delay: delay,
                child: childAnimationBuilder(widget),
              ),
            );
          })
          .values
          .toList();

  static AnimationConfigurationClass? of(BuildContext context) {
    return context.findAncestorWidgetOfExactType<AnimationConfigurationClass>();
  }
}

class AnimationConfiguratorClass extends StatelessWidget {
  final Duration? duration;
  final Duration? delay;
  final Widget Function(Animation<double>) animatedChildBuilder;

  const AnimationConfiguratorClass({
    super.key,
    this.duration,
    this.delay,
    required this.animatedChildBuilder,
  });

  @override
  Widget build(BuildContext context) {
    final animationConfiguration = AnimationConfigurationClass.of(context);

    if (animationConfiguration == null) {
      throw FlutterError.fromParts(
        <DiagnosticsNode>[
          ErrorSummary('Animation not wrapped in an AnimationConfiguration.'),
          ErrorDescription(
              'This error happens if you use an Animation that is not wrapped in an '
              'AnimationConfiguration.'),
          ErrorHint(
              'The solution is to wrap your Animation(s) with an AnimationConfiguration. '
              'Reminder: an AnimationConfiguration provides the configuration '
              'used as a base for every children Animation. Configuration made in AnimationConfiguration '
              'can be overridden in Animation children if needed.'),
        ],
      );
    }

    final _position = animationConfiguration.position;
    final _duration = duration ?? animationConfiguration.duration;
    final _delay = delay ?? animationConfiguration.delay;
    final _columnCount = animationConfiguration.columnCount;

    return AnimationExecutorClass(
      duration: _duration,
      delay: stagger(_position, _duration, _delay, _columnCount),
      builder: (context, animationController) =>
          animatedChildBuilder(animationController!),
    );
  }

  Duration stagger(
      int position, Duration duration, Duration? delay, int columnCount) {
    var delayInMilliseconds =
        (delay == null ? duration.inMilliseconds ~/ 6 : delay.inMilliseconds);

    int _computeStaggeredGridDuration() {
      return (position ~/ columnCount + position % columnCount) *
          delayInMilliseconds;
    }

    int _computeStaggeredListDuration() {
      return position * delayInMilliseconds;
    }

    return Duration(
        milliseconds: columnCount > 1
            ? _computeStaggeredGridDuration()
            : _computeStaggeredListDuration());
  }
}

typedef AnimatedConfigBuilder = Widget Function(
    BuildContext context, AnimationController? animationController);

class AnimationExecutorClass extends StatefulWidget {
  final Duration duration;
  final Duration delay;
  final AnimatedConfigBuilder builder;

  const AnimationExecutorClass({
    super.key,
    required this.duration,
    this.delay = Duration.zero,
    required this.builder,
  });

  @override
  _AnimationExecutorClassState createState() => _AnimationExecutorClassState();
}

class _AnimationExecutorClassState extends State<AnimationExecutorClass>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(duration: widget.duration, vsync: this);

    if (AnimationLimiterWidget.shouldRunAnimation(context) ?? true) {
      _timer = Timer(widget.delay, () => _animationController!.forward());
    } else {
      _animationController!.value = 1.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: _animationController!,
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _animationController!.dispose();
    super.dispose();
  }

  Widget _buildAnimation(BuildContext context, Widget? child) {
    return widget.builder(context, _animationController);
  }
}

/// An animation that fades its child.
class FadeInAnimationWidget extends StatelessWidget {
  /// The duration of the child animation.
  final Duration? duration;

  /// The delay between the beginning of two children's animations.
  final Duration? delay;

  /// The curve of the child animation. Defaults to [Curves.ease].
  final Curve curve;

  /// The child Widget to animate.
  final Widget child;

  /// Creates a fade animation that fades its child.
  ///
  /// The [child] argument must not be null.
  const FadeInAnimationWidget({
    super.key,
    this.duration,
    this.delay,
    this.curve = Curves.ease,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguratorClass(
      duration: duration,
      delay: delay,
      animatedChildBuilder: _fadeInAnimation,
    );
  }

  Widget _fadeInAnimation(Animation<double> animation) {
    final _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animation,
        curve: Interval(0.0, 1.0, curve: curve),
      ),
    );

    return Opacity(
      opacity: _opacityAnimation.value,
      child: child,
    );
  }
}

/// An enum representing a flip axis.
enum FlipAxisClass {
  /// The x axis (vertical flip)
  x,

  /// The y axis (horizontal flip)
  y,
}

/// An animation that flips its child either vertically or horizontally.
class FlipAnimationWidget extends StatelessWidget {
  /// The duration of the child animation.
  final Duration? duration;

  /// The delay between the beginning of two children's animations.
  final Duration? delay;

  /// The curve of the child animation. Defaults to [Curves.ease].
  final Curve curve;

  /// The [FlipAxisClass] in which the child widget will be flipped.
  final FlipAxisClass flipAxis;

  /// The child Widget to animate.
  final Widget child;

  /// Creates a flip animation that flips its child.
  ///
  /// Default value for [flipAxis] is [FlipAxisClass.x].
  ///
  /// The [child] argument must not be null.
  const FlipAnimationWidget({
    super.key,
    this.duration,
    this.delay,
    this.curve = Curves.ease,
    this.flipAxis = FlipAxisClass.x,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguratorClass(
      duration: duration,
      delay: delay,
      animatedChildBuilder: _flipAnimation,
    );
  }

  Widget _flipAnimation(Animation<double> animation) {
    final _flipAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animation,
        curve: Interval(0.0, 1.0, curve: curve),
      ),
    );

    Matrix4 _computeTransformationMatrix() {
      var radians = (1 - _flipAnimation.value) * pi / 2;

      switch (flipAxis) {
        case FlipAxisClass.y:
          return Matrix4.rotationY(radians);
        case FlipAxisClass.x:
        default:
          return Matrix4.rotationX(radians);
      }
    }

    return Transform(
      transform: _computeTransformationMatrix(),
      alignment: Alignment.center,
      child: child,
    );
  }
}

/// An animation that scales its child.
class ScaleAnimationWidget extends StatelessWidget {
  /// The duration of the child animation.
  final Duration? duration;

  /// The delay between the beginning of two children's animations.
  final Duration? delay;

  /// The curve of the child animation. Defaults to [Curves.ease].
  final Curve curve;

  /// Scaling factor to apply at the start of the animation.
  final double scale;

  /// The child Widget to animate.
  final Widget child;

  /// Creates a scale animation that scales its child for its center.
  ///
  /// Default value for [scale] is 0.0.
  ///
  /// The [child] argument must not be null.
  const ScaleAnimationWidget({
    super.key,
    this.duration,
    this.delay,
    this.curve = Curves.ease,
    this.scale = 0.0,
    required this.child,
  })  : assert(scale >= 0.0);

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguratorClass(
      duration: duration,
      delay: delay,
      animatedChildBuilder: _landingAnimation,
    );
  }

  Widget _landingAnimation(Animation<double> animation) {
    final _landingAnimation = Tween<double>(begin: scale, end: 1.0).animate(
      CurvedAnimation(
        parent: animation,
        curve: Interval(0.0, 1.0, curve: curve),
      ),
    );

    return Transform.scale(
      scale: _landingAnimation.value,
      child: child,
    );
  }
}

/// An animation that slides its child.
class SlideAnimationWidget extends StatelessWidget {
  /// The duration of the child animation.
  final Duration? duration;

  /// The delay between the beginning of two children's animations.
  final Duration? delay;

  /// The curve of the child animation. Defaults to [Curves.ease].
  final Curve curve;

  /// The vertical offset to apply at the start of the animation (can be negative).
  final double verticalOffset;

  /// The horizontal offset to apply at the start of the animation (can be negative).
  final double horizontalOffset;

  /// The child Widget to animate.
  final Widget child;

  /// Creates a slide animation that slides its child from the given
  /// [verticalOffset] and [horizontalOffset] to its final position.
  ///
  /// A default value of 50.0 is applied to [verticalOffset] if
  /// [verticalOffset] and [horizontalOffset] are both undefined or null.
  ///
  /// The [child] argument must not be null.
  const SlideAnimationWidget({
    super.key,
    this.duration,
    this.delay,
    this.curve = Curves.ease,
    double? verticalOffset,
    double? horizontalOffset,
    required this.child,
  })  : verticalOffset = verticalOffset ?? 50.0,
        horizontalOffset = horizontalOffset ?? 0.0;

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguratorClass(
      duration: duration,
      delay: delay,
      animatedChildBuilder: _slideAnimation,
    );
  }

  Widget _slideAnimation(Animation<double> animation) {
    Animation<double> offsetAnimation(
        double offset, Animation<double> animation) {
      return Tween<double>(begin: offset, end: 0.0).animate(
        CurvedAnimation(
          parent: animation,
          curve: Interval(0.0, 1.0, curve: curve),
        ),
      );
    }

    return Transform.translate(
      offset: Offset(
        horizontalOffset == 0.0
            ? 0.0
            : offsetAnimation(horizontalOffset, animation).value,
        verticalOffset == 0.0
            ? 0.0
            : offsetAnimation(verticalOffset, animation).value,
      ),
      child: child,
    );
  }
}
//endregion