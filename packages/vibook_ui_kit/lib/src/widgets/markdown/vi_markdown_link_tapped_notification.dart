import 'package:vibook_ui_kit/src/notification/vi_notification.dart';

class ViMarkdownLinkTappedNotification extends ViNotification {
  final String text;
  final String? href;
  final String title;

  const ViMarkdownLinkTappedNotification({
    required this.text,
    required this.href,
    required this.title,
  });
}
