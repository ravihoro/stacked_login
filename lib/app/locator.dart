import 'package:get_it/get_it.dart';
import 'package:stacked_login/services/authentication.dart';
import 'package:stacked_login/ui/views/home/home_viewmodel.dart';
import 'package:stacked_login/ui/views/login/login_viewmodel.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => Authentication());
  locator.registerLazySingleton(() => LoginViewModel());
  locator.registerLazySingleton(() => HomeViewModel());
}
