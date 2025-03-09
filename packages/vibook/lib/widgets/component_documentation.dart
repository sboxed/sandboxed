import 'package:flutter/material.dart';
import 'package:vibook/widgets/vi_markdown.dart';

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
        width: 1000,
        child: ViMarkdown.scrollable(body),
      ),
    );
  }
}
