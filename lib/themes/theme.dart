import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gdsc_appdev/constants/constants.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightThemeData() {
  //For system navigation bar
  Future.delayed(Duration(milliseconds: 100)).then(
      (value) => SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
            systemNavigationBarColor: Colors.transparent,
            systemNavigationBarIconBrightness: Brightness.dark,
          )));
  return ThemeData(
    inputDecorationTheme: InputDecorationTheme().copyWith(
      fillColor: kContentColorDarkTheme,
      // hintStyle: TextStyle(color: Colors.black54),
    ),
    brightness: Brightness.light,
    primaryColor: kPrimaryColor,
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      backgroundColor: kPrimaryColor,
      elevation: 0,
      centerTitle: false,
    ),
    scaffoldBackgroundColor: Colors.white,
    iconTheme: IconThemeData(color: kContentColorLightTheme),
    textTheme: GoogleFonts.interTextTheme(ThemeData.light().textTheme).apply(
      bodyColor: kContentColorLightTheme,
    ),
    colorScheme: ColorScheme.light(
      primary: kPrimaryColor,
      secondary: kSecondaryColor,
      error: kErrorColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: kContentColorLightTheme.withOpacity(0.7),
      unselectedItemColor: kContentColorLightTheme.withOpacity(0.32),
      selectedIconTheme: IconThemeData(color: kPrimaryColor),
      showUnselectedLabels: true,
    ),
  );
}
