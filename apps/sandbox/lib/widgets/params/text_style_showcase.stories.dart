import 'package:flutter/material.dart';
import 'package:sandboxed_core/sandboxed_core.dart';
import 'package:sandboxed_sandbox/widgets/params/text_style_showcase.dart';

Meta get meta => const Meta<TextStyleShowcase>(name: 'TextStyle Showcase');

Story get $Default => const Story(
  name: 'Default',
  params: {
    'style': TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
  },
);

Story get $Bold => const Story(
  name: 'Bold',
  params: {
    'style': TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
  },
);

Story get $Italic => const Story(
  name: 'Italic',
  params: {
    'style': TextStyle(
      fontSize: 16,
      fontStyle: FontStyle.italic,
      color: Colors.blueGrey,
    ),
  },
);

Story get $Decorated => const Story(
  name: 'Decorated',
  params: {
    'style': TextStyle(
      fontSize: 16,
      decoration: TextDecoration.underline,
      decorationColor: Colors.blue,
      decorationStyle: TextDecorationStyle.solid,
      decorationThickness: 2.0,
    ),
  },
);

Story get $Colorful => const Story(
  name: 'Colorful',
  params: {
    'style': TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.deepPurple,
      letterSpacing: 1.2,
    ),
  },
);

Story get $Spaced => const Story(
  name: 'Spaced',
  params: {
    'style': TextStyle(
      fontSize: 14,
      letterSpacing: 3.0,
      wordSpacing: 5.0,
      height: 1.8,
    ),
  },
);
