import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ComponentDocumentation extends StatelessWidget {
  final String body;

  const ComponentDocumentation({
    super.key,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Markdown(
      selectable: true,
      onTapLink: (text, href, title) async {
        if (href == null) return;
        if (await canLaunchUrlString(href)) {
          launchUrlString(href);
        } else {
          Clipboard.setData(ClipboardData(text: href));
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Link copied into clipboard')));
          }
        }
      },
      data: body,
    );
  }
}
