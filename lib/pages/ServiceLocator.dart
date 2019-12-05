import 'package:get_it/get_it.dart';
import './TelService.dart';

GetIt locator = GetIt();
void setupLocator() {
  locator.registerSingleton(TelService());
}