import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vibook/provider/addons.dart';
import 'package:vibook/provider/selected.dart';
import 'package:vibook/widgets/story_name.dart';
import 'package:vibook_core/component.dart';
import 'package:vibook_core/story.dart';

// STOPSHIP(@melvspace): 03/04/25 not knobs
class KnobsInspector extends ConsumerWidget {
  const KnobsInspector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTextStyle.merge(
      style: TextStyle(
        color: Theme.of(context).colorScheme.onSurface,
      ),
      child: Column(
        children: [
          AppBar(
            title: const StoryName(),
            backgroundColor: Colors.transparent,
          ),
          if (ref.watch(selectedStoryProvider)
              case (Component component, Story story))
            Flexible(
              child: ListView(
                padding: const EdgeInsets.all(16.0),
                children: [
                  for (final addon in ref.watch(addonsProvider))
                    if (addon.buildEditor(context) case Widget editor)
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: KeyedSubtree(
                            key: Key(addon.id),
                            child: editor,
                          ),
                        ),
                      ),
                ],
              ),
            )
          else
            const SizedBox(),
        ],
      ),
    );
  }
}
