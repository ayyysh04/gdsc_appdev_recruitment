import 'package:flutter/material.dart';
import 'package:gdsc_appdev/routes/route_constants.dart';

Route generateRoute(RouteSettings settings) {
  switch (settings.name) {
    // case RouteConstants.SigninScreen:
    //   return bottomSlidePageBuilder(
    //     screen: SigninScreen(),
    //   );
    // case RouteConstants.homeScreen:
    //   return bottomSlidePageBuilder(
    //     screen: homeScreen(),
    //   );

    default:
      return bottomSlidePageBuilder(
        screen: const Text(
          'Unknown Screen. Please restart the app.',
          textAlign: TextAlign.center,
        ),
      );
  }
}

PageRouteBuilder bottomSlidePageBuilder({
  required Widget screen,
}) {
  return PageRouteBuilder(
    pageBuilder: (c, a1, a2) => screen,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

PageRouteBuilder rightSlidePageBuilder({
  required Widget screen,
}) {
  return PageRouteBuilder(
    pageBuilder: (c, a1, a2) => screen,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(-1.0, 0.0);
      const end = Offset(0.0, 0.0);
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(
        textDirection: TextDirection.rtl,
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
