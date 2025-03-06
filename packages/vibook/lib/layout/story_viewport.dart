import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vibook/addons/decorator_addon.dart';
import 'package:vibook/provider/addons.dart';
import 'package:vibook/provider/params.dart';
import 'package:vibook/provider/selected.dart';
import 'package:vibook/toolbar/toolbar.dart';
import 'package:vibook_core/story_view.dart';

class StoryViewport extends ConsumerWidget {
  const StoryViewport({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const Toolbar(),
        if (ref.watch(selectedElementProvider)
            case StorySelection(:final component, :final story))
          Expanded(
            child: ListenableBuilder(
              listenable: ref.watch(paramsProvider),
              builder: (context, child) => StoryView(
                meta: component.meta,
                story: story,
                params: ref.watch(paramsProvider),
                decorators: [
                  for (final addon in ref.watch(addonsProvider))
                    if (addon case DecoratorAddon decorator)
                      ...decorator.decorate(context),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
