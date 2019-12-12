import 'package:get_it/get_it.dart';
import 'package:mac_mobile_attempt/helpers/tel_service.dart';

GetIt locator = GetIt();

void setupLocator() {
  locator.registerSingleton(TelService());
}