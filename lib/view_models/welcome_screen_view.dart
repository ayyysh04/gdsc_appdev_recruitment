import 'package:flutter/material.dart';
import 'package:gdsc_appdev/routes/route_constants.dart';
import 'package:gdsc_appdev/services/locator.dart';
import 'package:gdsc_appdev/services/navigation_service.dart';
import 'package:gdsc_appdev/services/shared_prefs.dart';
import 'package:gdsc_appdev/enums/pageNavigatorMethod.dart';
import 'package:gdsc_appdev/views/homepage/home_page.dart';
import 'package:gdsc_appdev/views/login_view.dart';

class WelcomeScreenViewModel {
  final SharedPrefs _sharedPrefs = locator.get();
  final NavigationService _navigationService = locator<NavigationService>();
  Widget isFirstLogin() {
    if (_sharedPrefs.isLogin) {
      return HomeScreen();
    }

    return LoginScreen();
  }

  void navigateToSigninOrSignUpScreen() {
    _navigationService.navigatorHandler(
        routeName: RouteConstants.SigninOrSignUpScreen,
        method: pageMethod.Push);
  }
}
