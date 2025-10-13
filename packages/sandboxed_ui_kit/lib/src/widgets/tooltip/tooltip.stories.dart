import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:sandboxed_core/sandboxed_core.dart';
import 'package:sandboxed_ui_kit/src/widgets/tooltip/tooltip.dart';

Meta get meta => Meta<SBTooltip>(name: "Tooltip");

Story get $Default => Story(
      builder: (context, params) {
        return SBTooltip(
          tooltip: Text(
            params
                .string('message', maxLines: null) //
                .required('Tooltip'),
          ),
          position: params
              .single('position', SBTooltipPosition.values)
              .optional(null),
          child: ElevatedButton(
            onPressed: () {},
            child: const Text("Hover me"),
          ),
        );
      },
    );

Story get $Markdown => Story(
      builder: (context, params) {
        return SBTooltip(
          tooltip: SizedBox(
            width: 500,
            child: MarkdownBody(
              data: params
                  .string('message', maxLines: null) //
                  .required("""
# Tooltip Test Document

This is a **bold** word and this is *italic*.  
Here’s a [link to example.com](https://example.com) — hover to see tooltip text if supported.

Inline code: `flutter run`  

Code block:
```dart
print("Hello Tooltip!");
```
                """),
            ),
          ),
          position: params
              .single('position', SBTooltipPosition.values)
              .optional(null),
          child: ElevatedButton(
            onPressed: () {},
            child: const Text("Hover me"),
          ),
        );
      },
    );
