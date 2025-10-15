import 'package:flutter/widgets.dart';
import 'package:sandboxed_core/sandboxed_core.dart';

Meta get meta => const Meta<Text>(name: 'Markdown Documentation');

Story get $Default => Story(
  builder: (context, params) {
    return const Text(
      'This story shows markdown documentation support\nSee [markdown_documentation.mdx]',
    );
  },
);
