import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sandboxed/routing/sandboxed_router_provider.dart';

class SBShareButton extends StatelessWidget {
  const SBShareButton({super.key});

  @override
  Widget build(BuildContext context) {
    var origin = switch (Uri.base.scheme) {
      'https' || 'http' => Uri.base.origin,
      _ => ''
    };

    return FilledButton(
      onPressed: () {
        final url = context.currentUrl ?? '/';

        Clipboard.setData(
          ClipboardData(
            text: origin + url,
          ),
        );

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Link copied to clipboard"),
          ),
        );
      },
      child: const Text("Share"),
    );
  }
}
