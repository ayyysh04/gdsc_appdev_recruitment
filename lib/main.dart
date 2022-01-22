import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:gdsc_appdev/services/locator.dart';
import 'package:gdsc_appdev/themes/theme.dart';
import 'package:gdsc_appdev/view_models/welcome_screen_view.dart';
import 'package:page_transition/src/enum.dart';
import 'routes/route_page_handler.dart' as route_page;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final WelcomeScreenViewModel model = locator.get<WelcomeScreenViewModel>();
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimatedSplashScreen(
        backgroundColor: Colors.white,
        splash: Text("GDSC app dev recruitment"),
        nextScreen: model.isFirstLogin(),
        splashIconSize: 150,
        pageTransitionType: PageTransitionType.fade,
      ),
      debugShowCheckedModeBanner: false,
      theme: lightThemeData(),
      onGenerateRoute: route_page.generateRoute,
    );
  }
}
