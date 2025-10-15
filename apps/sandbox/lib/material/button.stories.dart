import 'package:flutter/material.dart';
import 'package:sandboxed/sandboxed.dart';

Meta get meta => Meta<Widget>(
  name: 'Material / Button',
  order: 100,
);

Story get $Default => Story(
  decorators: [Zoom(scale: 3)],
  builder: (context, params) {
    final enabled = params.boolean("enabled").required(true);
    final callback = enabled ? () {} : null;

    return Column(
      spacing: 8,
      mainAxisSize: MainAxisSize.min,
      children: [
        FilledButton(onPressed: callback, child: Text("Filled Button")),
        FilledButton.tonal(onPressed: callback, child: Text("Filled Button (Tonal)")),
        ElevatedButton(onPressed: callback, child: Text("Primary Button")),
        OutlinedButton(onPressed: callback, child: Text("Outlined Button")),
        TextButton(onPressed: callback, child: Text("Text Button")),
      ],
    );
  },
);
