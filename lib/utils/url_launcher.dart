import 'package:url_launcher/url_launcher_string.dart';

Future<void> urlLaunchInBrowser(String url) async {
  if (!await launchUrlString(
    url,
    mode: LaunchMode.externalApplication,
  )) {
    throw Exception('Could not launch $url');
  }
}

void sendEmail(String emailAddress) async {
  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: emailAddress,
  );

  if (await canLaunchUrlString(emailLaunchUri.toString())) {
    await launchUrlString(emailLaunchUri.toString());
  } else {
    throw 'Could not launch email';
  }
}

