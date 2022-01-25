import 'package:gdsc_appdev/services/clothes_service.dart';
import 'package:gdsc_appdev/services/navigation_service.dart';
import 'package:gdsc_appdev/services/shared_prefs.dart';
import 'package:gdsc_appdev/view_models/home_screen_view_model.dart';
import 'package:gdsc_appdev/view_models/signin_screen_viewmodel.dart';
import 'package:gdsc_appdev/view_models/welcome_screen_view.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;
void setupLocator() {
  // storage servics
  locator.registerLazySingleton(() => SharedPrefs());
  //navigation services
  locator.registerLazySingleton(() => NavigationService());

  //app services
  locator.registerLazySingleton(() => ClothesService());

//viewModels (Factory)
  locator.registerFactory(() => SigninScreenViewModel());
  locator.registerFactory(() => WelcomeScreenViewModel());
  locator.registerLazySingleton(() => HomeScreenViewModel());
}
