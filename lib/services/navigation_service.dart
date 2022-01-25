import 'package:flutter/material.dart';
import 'package:gdsc_appdev/enums/page_navigator_method.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

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
      case pageMethod.push:
        return _navigatePushTo(routeName, arguments: arguments);

      case pageMethod.popAndPush:
        return _navigatePopAndPushTo(routeName, arguments: arguments);

      case pageMethod.replacement:
        return _navigateReplaceTo(routeName, arguments: arguments);

      case pageMethod.pushAndRemovePrevious:
        return _navigatePushAndRemovePrevious(routeName, arguments: arguments);

      default:
        return _navigatePushTo(routeName);
    }
  }
}
