import 'package:flutter/material.dart';

/// This transition will take effect once added to the material widget
/// Also, [CustomPageRoute] will take effect as it extends the MaterialPageRoute
///
class CustomTransitionBuilder extends PageTransitionsBuilder {
  CustomTransitionBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    final tween = Tween(
      begin: const Offset(1, 0),
      end: Offset.zero,
    ).chain(CurveTween(curve: Curves.decelerate));

    return SlideTransition(
      position: animation.drive(tween),
      child: FadeTransition(opacity: animation, child: child),
    );
  }
}

/// MaterialPageRoute offers 300 milliseconds by default
/// to modify that we override this class
/// Make sure to use [CustomPageRoute] instead of [MaterialPageRoute] for navigation
class CustomPageRoute extends MaterialPageRoute {
  CustomPageRoute({required WidgetBuilder builder}) : super(builder: builder);

  @override
  Duration get transitionDuration => const Duration(milliseconds: 150);
}

/// Use this class when need to go back in navigation stack
/// This gives a backward slide animation
///
class CustomPageBackwardTransition extends PageRouteBuilder {
  CustomPageBackwardTransition({
    required super.pageBuilder,
  }) : super(
          transitionDuration: const Duration(milliseconds: 500),
          transitionsBuilder: (context, animation, animationSecond, child) {
            final tween = Tween(
              begin: const Offset(-1, 0),
              end: Offset.zero,
            ).chain(CurveTween(curve: Curves.decelerate));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );
}
