import 'package:flutter/material.dart';
import 'package:gdsc_appdev/enums/pageNavigatorMethod.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  dynamic _navigatePushTo(String routeName, {dynamic arguments}) async {
    return await navigatorKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> _navigateReplaceTo(String routeName,
      {dynamic arguments}) async {
    return await navigatorKey.currentState!
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> _navigatePopAndPushTo(String routeName,
      {dynamic arguments}) async {
    return await navigatorKey.currentState!
        .popAndPushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> _navigatePushAndRemovePrevious(String routeName,
      {dynamic arguments}) async {
    return await navigatorKey.currentState!.pushNamedAndRemoveUntil(
        routeName, (route) => false,
        arguments: arguments);
  }

  void goBack() {
    return navigatorKey.currentState!.pop();
  }

  Future<dynamic> navigatorHandler(
      {required pageMethod method,
      required String routeName,
      dynamic arguments}) {
    switch (method) {
      case pageMethod.Push:
        return _navigatePushTo(routeName, arguments: arguments);

      case pageMethod.PopAndPush:
        return _navigatePopAndPushTo(routeName, arguments: arguments);

      case pageMethod.Replacement:
        return _navigateReplaceTo(routeName, arguments: arguments);

      case pageMethod.PushAndRemovePrevious:
        return _navigatePushAndRemovePrevious(routeName, arguments: arguments);

      default:
        return _navigatePushTo(routeName);
    }
  }
}
