import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        Clipboard.setData(
          ClipboardData(
            text: origin + AutoRouter.of(context).urlState.url,
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
