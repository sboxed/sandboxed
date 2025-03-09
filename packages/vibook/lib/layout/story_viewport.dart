import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vibook/addons/decorator_addon.dart';
import 'package:vibook/provider/addons.dart';
import 'package:vibook/provider/params.dart';
import 'package:vibook/provider/selected.dart';
import 'package:vibook/toolbar/toolbar.dart';
import 'package:vibook/widgets/element_name.dart';
import 'package:vibook_core/story_view.dart';

class StoryViewport extends ConsumerWidget {
  final String id;

  const StoryViewport({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Card(
          shape: const LinearBorder(),
          margin: const EdgeInsets.only(bottom: 4),
          child: Column(
            children: [
              AppBar(
                title: ElementName(id: id),
                backgroundColor: Colors.transparent,
                // ignore: prefer_const_literals_to_create_immutables
                actions: [
                  // ignore: prefer_const_constructors
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    // ignore: prefer_const_constructors
                    child: ActionChip(
                      // TODO(@melvspace): 03/06/25 navigate to docs.
                      // onPressed: () => AutoRouter.of(context).navigate(),
                      label: const Text('Docs'),
                    ),
                  )
                ],
              ),
              const Toolbar(),
            ],
          ),
        ),
        if (ref.watch(selectionProvider(id))
            case StorySelection(:final component, :final story))
          Expanded(
            child: ClipRect(
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
          ),
      ],
    );
  }
}
