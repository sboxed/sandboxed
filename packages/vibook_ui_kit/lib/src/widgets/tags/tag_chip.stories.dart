import 'package:flutter/material.dart';
import 'package:vibook_core/vibook_core.dart';
import 'package:vibook_ui_kit/vibook_ui_kit.dart';

Meta get meta => const Meta<TagChip>();

Story get $Default => Story(
      builder: (context, params) {
        return TagChip(
          tag: Text(params.string('tag').required('Fresh')),
          color: params.color('color').required(Colors.green),
        );
      },
    );

Story get $InTile => Story(
      decorators: [
        Decorator(
          (context, story) => SizedBox(
            width: 390,
            child: story,
          ),
        ),
      ],
      builder: (context, params) {
        return ListTile(
          selected: params.boolean('selected').required(true),
          title: Row(
            children: [
              const Text('Tile'),
              const SizedBox(width: 12),
              TagChip(
                tag: Text(params.string('tag').required('Fresh')),
                color: params.color('color').required(Colors.green),
              ),
            ],
          ),
        );
      },
    );
