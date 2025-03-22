import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sandboxed/sandboxed.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SBNotificationListener extends StatelessWidget {
  final Widget child;

  const SBNotificationListener({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return NotificationListener<SBNotification>(
      onNotification: (notification) {
        switch (notification) {
          case SBMarkdownLinkTappedNotification(:final href):
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
