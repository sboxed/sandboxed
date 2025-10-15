// ignore_for_file: implementation_imports

import 'package:flutter/material.dart';
import 'package:sandboxed_core/sandboxed_core.dart';

Meta get meta => Meta<Chip>(
  name: 'Chips', // optional
  module: 'Controls',
  decorators: [
    Decorator(
      (context, story) => Padding(padding: const EdgeInsets.all(8.0), child: story),
    ),
  ],
);

Story get $Playground => Story(
  name: 'Playground',
  params: {
    // STOPSHIP(@melvspace): 10/11/25
    // 'label': UseParams(
    //   (params) => Text(
    //     params.string('labelText').required('Label'),
    //   ),
    // ),
  },
);

Story get $Chip => Story(
  name: 'Chip',
  builder: (context, params) => Chip(label: Text(params.string('labelText').required('Label'))),
);

Story get $InputChip => Story(
  name: 'InputChip',
  builder: (context, params) => InputChip(
    onPressed: () {},
    selected: params.boolean('selected').required(false),
    label: Text(params.string('labelText').required('Label')),
  ),
);

Story get $ChoiceChip => Story(
  name: 'ChoiceChip',
  builder: (context, params) => ChoiceChip(
    onSelected: (value) {},
    label: Text(
      params
          .string('labelText') //
          // STOPSHIP(@melvspace): 10/11/25
          // .apply('readonly', true)
          .required('Label'),
    ),
    selected: params.boolean('selected').required(false),
  ),
);

Story get $FilterChip => Story(
  name: 'FilterChip',
  builder: (context, params) => FilterChip(
    label: Text(
      params
          .string('labelText') //
          // STOPSHIP(@melvspace): 10/11/25
          // .apply('readonly', true)
          .required('Label'),
    ),
    selected: params.boolean('selected').required(false),
    onSelected: (value) {},
  ),
);

Story get $ActionChip => Story(
  name: 'ActionChip',
  builder: (context, params) => ActionChip(
    onPressed: () {},
    label: Text(
      params
          .string('labelText') //
          // STOPSHIP(@melvspace): 10/11/25
          // .apply('readonly', true)
          .required('Label'),
    ),
  ),
);
