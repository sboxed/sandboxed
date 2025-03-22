import 'package:flutter/material.dart';
import 'package:sandboxed_ui_kit/sandboxed_ui_kit.dart';

class ComponentDocumentation extends StatelessWidget {
  final String body;

  const ComponentDocumentation({
    super.key,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 960,
        child: SBMarkdown.scrollable(
          body,
        ),
      ),
    );
  }
}
