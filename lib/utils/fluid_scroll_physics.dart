import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// Ultra-smooth, low-friction scroll physics that glides effortlessly like liquid water.
class FluidScrollPhysics extends BouncingScrollPhysics {
  const FluidScrollPhysics({super.parent});

  @override
  FluidScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return FluidScrollPhysics(parent: buildParent(ancestor));
  }

  @override
  double get minFlingVelocity => 20.0; // Responsive touch and mouse wheel flings

  @override
  double get maxFlingVelocity => 8000.0;

  @override
  double frictionFactor(double overscrollFraction) {
    // Ultra-smooth glide friction
    return 0.006 * (1.0 - overscrollFraction);
  }
}

/// Custom AppScrollBehavior enabling seamless mouse-wheel & drag scrolling across desktop and web
class FluidScrollBehavior extends MaterialScrollBehavior {
  const FluidScrollBehavior();

  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
        PointerDeviceKind.stylus,
      };

  @override
  Widget buildScrollbar(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    return RawScrollbar(
      controller: details.controller,
      thumbColor: const Color(0xFF06B6D4).withValues(alpha: 0.5),
      radius: const Radius.circular(8),
      thickness: 6,
      fadeDuration: const Duration(milliseconds: 300),
      timeToFade: const Duration(milliseconds: 800),
      child: child,
    );
  }
}
