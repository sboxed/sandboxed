// ignore_for_file: implementation_imports

import 'package:flutter/material.dart';
import 'package:sandboxed_core/src/params/use_params.dart';
import 'package:sandboxed_core/sandboxed_core.dart';

Meta get meta => Meta<Chip>(
      name: 'Chips', // optional
      module: 'Controls',
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
      params: {
        'label': UseParams(
          (params) => Text(
            params
                .string('labelText')
                .apply('readonly', true)
                .required('Label'),
          ),
        ),
      },
    );

Story get $InputChip => Story(
      name: 'InputChip',
      params: {
        'label': UseParams(
          (params) => Text(
            params
                .string('labelText')
                .apply('readonly', true)
                .required('Label'),
          ),
        ),
      },
    );

Story get $ChoiceChip => Story(
      name: 'ChoiceChip',
      params: {
        'label': UseParams(
          (params) => Text(
            params
                .string('labelText')
                .apply('readonly', true)
                .required('Label'),
          ),
        ),
      },
    );

Story get $FilterChip => Story(
      name: 'FilterChip',
      params: {
        'label': UseParams(
          (params) => Text(
            params
                .string('labelText')
                .apply('readonly', true)
                .required('Label'),
          ),
        ),
      },
    );

Story get $ActionChip => Story(
      name: 'ActionChip',
      params: {
        'label': UseParams(
          (params) => Text(
            params
                .string('labelText')
                .apply('readonly', true)
                .required('Label'),
          ),
        ),
      },
    );
