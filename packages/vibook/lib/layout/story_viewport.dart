import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vibook/provider/addons.dart';
import 'package:vibook/provider/selected.dart';
import 'package:vibook/toolbar/toolbar.dart';
import 'package:vibook_core/component.dart';
import 'package:vibook_core/story.dart';
import 'package:vibook_core/story_view.dart';

class StoryViewport extends ConsumerWidget {
  const StoryViewport({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const Toolbar(),
        if (ref.watch(selectedStoryProvider)
            case (Component component, Story story))
          Expanded(
            child: StoryView(
              meta: component.meta(),
              story: story,
              decorators: [
                for (final addon in ref.watch(addonsProvider))
                  ...addon.decorate(context),
              ],
            ),
          ),
      ],
    );
  }
}
