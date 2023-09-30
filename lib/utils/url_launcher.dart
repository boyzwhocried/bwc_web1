import 'package:url_launcher/url_launcher_string.dart';

Future<void> urlLaunchInBrowser(String url) async {
  if (!await launchUrlString(
    url,
    mode: LaunchMode.externalApplication,
  )) {
    throw Exception('Could not launch $url');
  }
}
