import 'package:flutter/material.dart';
import 'package:vibook_core/decorator.dart';
import 'package:vibook_core/meta.dart';
import 'package:vibook_core/story.dart';

Meta get meta => Meta<Chip>(
      name: 'Chips', // optional
      decorators: [
        Decorator(
          (context, story) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: story,
          ),
        )
      ],
    );

Story get $Chip => Story(
      name: 'Chip',
      builder: (context, params) {
        return Chip(
          label: Text(params.string('label', 'Label')),
        );
      },
    );

Story get $InputChip => Story(
      name: 'InputChip',
      builder: (context, params) {
        return InputChip(
          label: Text(params.string('label', 'Label')),
        );
      },
    );

Story get $ChoiceChip => Story(
      name: 'ChoiceChip',
      builder: (context, params) {
        return ChoiceChip(
          onSelected: (value) => params.update('selected', value),
          selected: params.boolean('selected', false),
          showCheckmark: params.boolean('show_checkmark', true),
          label: Text(params.string('label', 'Label')),
        );
      },
    );

Story get $FilterChip => Story(
      name: 'FilterChip',
      builder: (context, params) {
        return FilterChip(
          onSelected: (value) => params.update('selected', value),
          selected: params.boolean('selected', false),
          showCheckmark: params.boolean('show_checkmark', true),
          label: Text(params.string('label', 'Label')),
        );
      },
    );

Story get $ActionChip => Story(
      name: 'ActionChip',
      builder: (context, params) {
        return ActionChip(
          onPressed: () {},
          label: Text(params.string('label', 'Label')),
        );
      },
    );
