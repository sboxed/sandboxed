import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:sandbox_feature/inline_editor_params.dart';
import 'package:sandboxed_core/sandboxed_core.dart';

Meta get meta => Meta<Text>(name: "Key Value Editor (Inline)");

Story get $Default => Story(
  builder: (context, params) {
    return Text(
      JsonEncoder.withIndent('  ').convert(
        params.dictionary('dictionary').required(
          {
            "title": "Title",
            "subtitle": "Subtitle",
            "body": "Body",
            "items": [
              "Item 1",
              "Item 2",
            ],
            "nested": {
              "title": "Nested Title",
              "subtitle": "Nested Subtitle",
              "body": "Nested Body",
            },
          },
        ),
      ),
    );
  },
);
