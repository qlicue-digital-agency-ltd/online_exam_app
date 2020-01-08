import 'package:url_launcher/url_launcher.dart';

class UrlLauncherService {
  void call(String number) async => await launch("tel:$number");
  void sendSms(String number) async => await launch("sms:$number");
  void sendEmail(String email) async => await launch("mailto:$email");
}
