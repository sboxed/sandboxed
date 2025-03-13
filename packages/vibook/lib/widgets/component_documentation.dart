import 'package:flutter/material.dart';
import 'package:vibook_ui_kit/vibook_ui_kit.dart';

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
        child: ViMarkdown.scrollable(
          body,
        ),
      ),
    );
  }
}
