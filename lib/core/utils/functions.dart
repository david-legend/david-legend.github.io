import 'package:url_launcher/url_launcher.dart';

class Functions {
  static void launchUrl(String url) async {
    await launch(url);
  }
}
