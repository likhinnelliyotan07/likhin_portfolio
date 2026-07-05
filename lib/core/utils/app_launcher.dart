import 'package:url_launcher/url_launcher.dart';

class AppLauncher {
  const AppLauncher._();

  static Future<void> openUrl(String url) async {
    final uri = Uri.parse(url);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  static Future<void> call(String phone) async {
    await openUrl('tel:${_cleanPhone(phone)}');
  }

  static Future<void> sendEmail({
    required String to,
    required String subject,
    required String body,
  }) async {
    final uri = Uri(
      scheme: 'mailto',
      path: to,
      queryParameters: {'subject': subject, 'body': body},
    );
    await launchUrl(uri);
  }

  static Future<void> whatsapp(String phone) {
    return openUrl('https://wa.me/${_cleanPhone(phone)}');
  }

  static String _cleanPhone(String phone) {
    return phone.replaceAll(RegExp(r'[^0-9+]'), '');
  }
}
