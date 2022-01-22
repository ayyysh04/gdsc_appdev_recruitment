import 'package:gdsc_appdev/services/navigation_service.dart';
import 'package:gdsc_appdev/view_models/welcome_screen_view.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;
void setupLocator() {
  //navigation services
  locator.registerLazySingleton(() => NavigationService());

//viewModels (Factory)
  locator.registerFactory(() => WelcomeScreenViewModel());
}
