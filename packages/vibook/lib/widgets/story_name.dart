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
        final (component, story) =
            ref.watch(selectedStoryProvider) ?? (null, null);

        return FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            component != null
                ? '${component.meta().displayName} / ${story!.name}'
                : 'Hello',
            style: TextStyle(
              color: ref.watch(brandColorProvider),
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
    );
  }
}
