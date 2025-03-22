import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sandboxed/provider/brand_color.dart';
import 'package:sandboxed/provider/selected.dart';

class ElementName extends StatelessWidget {
  final String? id;

  const ElementName({super.key, this.id});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final selection = ref.watch(
          id != null //
              ? selectionProvider(id!)
              : selectedElementProvider,
        );

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
