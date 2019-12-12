import 'package:url_launcher/url_launcher.dart';

class TelService {
  void call(String number) => launch("tel:$number");
}