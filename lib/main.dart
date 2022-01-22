import 'package:flutter/material.dart';
import 'package:gdsc_appdev/services/locator.dart';
import 'package:gdsc_appdev/themes/theme.dart';
import 'routes/route_page_handler.dart' as route_page;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightThemeData(),
      onGenerateRoute: route_page.generateRoute,
    );
  }
}
