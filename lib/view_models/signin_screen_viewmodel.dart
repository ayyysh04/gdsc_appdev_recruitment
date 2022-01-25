import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gdsc_appdev/enums/page_navigator_method.dart';
import 'package:gdsc_appdev/routes/route_constants.dart';
import 'package:gdsc_appdev/services/locator.dart';
import 'package:gdsc_appdev/services/navigation_service.dart';
import 'package:gdsc_appdev/services/shared_prefs.dart';
import 'package:get_it/get_it.dart';

class SigninScreenViewModel implements Disposable {
  //services access
  final SharedPrefs _sharedPrefs = locator.get();
  final NavigationService _navigationService = locator<NavigationService>();

//form key
  final formKey = GlobalKey<FormState>();

//controller access
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode phoneFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

//validations
  String? emailValidation(String? text) {
    if (text == null) {
      return "Please enter a email address";
    } else if (!RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(text)) {
      return "Please enter a valid email address";
    }
  }

  String? passwordValidation(String? text) {
    if (text == null) {
      return "Please enter a password";
    } else if (text.length < 8) {
      return "Please enter a password greater than 7 charaters";
    }
  }

  //dispose controllers
  void disposeForm() {
    phoneController.dispose();
    passwordController.dispose();
    phoneFocusNode.dispose();
    passwordFocusNode.dispose();
  }

//App logo
  String returnAppLogo(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? "assets/images/Logo_light.png"
        : "assets/images/Logo_dark.png";
  }

//Navigation
  void navigateToScreen(pageMethod method, String routeName) {
    _navigationService.navigatorHandler(method: method, routeName: routeName);
  }

  void signInNavigator(BuildContext context) {
    if (formKey.currentState!.validate()) {
      if (phoneController.text == "test@admin.com" &&
          passwordController.text == "12345678") //user login successfull
      {
        debugPrint("succesfull login");
        _sharedPrefs.isLogin = true;
        _navigationService.navigatorHandler(
            method: pageMethod.pushAndRemovePrevious,
            routeName: RouteConstants.homeScreen);
      } else {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Wrong credentials")));
      }
    }
    passwordController.clear();
  }

  void forgotPassword() {
    // TODO :write forget password logic here
  }

  @override
  FutureOr onDispose() {
    disposeForm();
  }
}
