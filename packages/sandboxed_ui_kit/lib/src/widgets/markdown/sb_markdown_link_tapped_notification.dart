import 'package:sandboxed_ui_kit/src/notification/sb_notification.dart';

class SBMarkdownLinkTappedNotification extends SBNotification {
  final String text;
  final String? href;
  final String title;

  const SBMarkdownLinkTappedNotification({
    required this.text,
    required this.href,
    required this.title,
  });
}
