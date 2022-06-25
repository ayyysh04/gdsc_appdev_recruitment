import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:gdsc_appdev/services/hive.dart';
import 'package:gdsc_appdev/services/locator.dart';
import 'package:gdsc_appdev/services/navigation_service.dart';
import 'package:gdsc_appdev/services/shared_prefs.dart';
import 'package:gdsc_appdev/themes/theme.dart';
import 'package:gdsc_appdev/view_models/welcome_screen_view.dart';
import 'package:page_transition/src/enum.dart';
import 'routes/route_page_handler.dart' as route_page;

//UI : https://dribbble.com/shots/15507510-Fashion-Store-Mobile-App
//task : https://docs.google.com/document/d/1GT36wY40ypTmuyk5OfPrfBMM6rkME749C2qqOag5qPs/edit
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  //storage services init
  await locator.get<SharedPrefs>().init();
  await locator.get<HiveUtil>().init();
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
        splash: Image(image: AssetImage("assets/images/gdsc1.png")),
        nextScreen: model.isFirstLogin(),
        splashIconSize: 180,
        pageTransitionType: PageTransitionType.fade,
      ),
      debugShowCheckedModeBanner: false,
      theme: lightThemeData(),
      onGenerateRoute: route_page.generateRoute,
      navigatorKey: locator<NavigationService>().navigatorKey,
    );
  }
}
