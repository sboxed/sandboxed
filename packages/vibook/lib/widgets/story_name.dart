import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vibook/provider/brand_color.dart';
import 'package:vibook/provider/selected.dart';

class StoryName extends StatelessWidget {
  const StoryName({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final selection = ref.watch(selectedElementProvider);
        Widget child;

        switch (selection) {
          case null:
            child = const Text('Select Story');

          case DocumentSelection(:final component, :final document):
            child = const Text('Select Story');
            child = Text(
              '${component.meta.displayName} / ${document.name}',
              style: TextStyle(color: ref.watch(brandColorProvider)),
            );

          case StorySelection(:final component, :final story):
            child = Text(
              '${component.meta.displayName} / ${story.name}',
              style: TextStyle(color: ref.watch(brandColorProvider)),
            );
        }

        return FittedBox(
          fit: BoxFit.fitWidth,
          child: DefaultTextStyle.merge(
            style: const TextStyle(fontWeight: FontWeight.w800),
            child: child,
          ),
        );
      },
    );
  }
}
