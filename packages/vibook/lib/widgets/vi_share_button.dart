import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ViShareButton extends StatelessWidget {
  const ViShareButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {
        Clipboard.setData(
          ClipboardData(
            text: Uri.base.origin + AutoRouter.of(context).urlState.url,
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
