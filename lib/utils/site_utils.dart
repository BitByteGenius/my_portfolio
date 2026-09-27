import 'package:url_launcher/url_launcher.dart';

class SiteUtils {
  static Future<void> openUrl(String url) async {
    if (url.isEmpty) return;
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    } else {
      // Fallback
      await launchUrl(uri);
    }
  }
}
