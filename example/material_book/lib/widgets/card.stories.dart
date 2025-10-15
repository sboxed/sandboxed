import 'package:flutter/material.dart';
import 'package:sandboxed_core/sandboxed_core.dart';

Meta get meta => Meta<Card>(name: "Card");

Story get $Default => Story(
  params: {
    "child": Padding(padding: EdgeInsets.all(8), child: Text("Hello world")),
  },
);

Story get $Nested => Story(
  builder: (context, params) {
    final depth =
        params //
            .integer('depth')
            .slider(min: 1, max: 5)
            .required(5);

    Widget build(int level) {
      if (level == 0) return Text("Card content");
      return Card.filled(
        elevation: 8,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: build(level - 1),
        ),
      );
    }

    return build(depth);
  },
);
