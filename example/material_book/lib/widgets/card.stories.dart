import 'package:flutter/material.dart';
import 'package:vibook_core/vibook_core.dart';

Meta get meta => Meta<Card>();

Story get $Default => Story();

Story get $Nested => Story(
      builder: (context, params) {
        final depth = params.integer('depth').required(5).clamp(1, 5);

        Widget build(int level) {
          if (level == 0) return Text("Card content");
          return Card.filled(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: build(level - 1),
            ),
          );
        }

        return build(depth);
      },
    );
