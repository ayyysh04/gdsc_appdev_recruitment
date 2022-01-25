import 'package:flutter/material.dart';
import 'package:gdsc_appdev/services/locator.dart';
import 'package:gdsc_appdev/services/shared_prefs.dart';
import 'package:gdsc_appdev/views/homepage/home_page.dart';
import 'package:gdsc_appdev/views/login_view.dart';

class WelcomeScreenViewModel {
  final SharedPrefs _sharedPrefs = locator.get();
  Widget isFirstLogin() {
    if (_sharedPrefs.isLogin) {
      return HomeScreen();
    }

    return LoginScreen();
  }
}
