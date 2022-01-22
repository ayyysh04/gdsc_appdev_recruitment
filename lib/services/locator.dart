import 'package:gdsc_appdev/services/navigation_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;
void setupLocator() {
  //navigation services
  locator.registerLazySingleton(() => NavigationService());
}
