import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:vibook/vibook.dart';

class ViNotificationListener extends StatelessWidget {
  final Widget child;

  const ViNotificationListener({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ViNotification>(
      onNotification: (notification) {
        switch (notification) {
          case ViMarkdownLinkTappedNotification(:final href):
            Future.microtask(() async {
              if (href == null) return;
              if (await canLaunchUrlString(href)) {
                launchUrlString(href);
              } else {
                Clipboard.setData(ClipboardData(text: href));
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Link copied into clipboard'),
                    ),
                  );
                }
              }
            });

            return true;
        }

        return false;
      },
      child: child,
    );
  }
}
