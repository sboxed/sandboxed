import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sandboxed/addons/mixins/decorator_addon.dart';
import 'package:sandboxed/provider/addons.dart';
import 'package:sandboxed/provider/params.dart';
import 'package:sandboxed/provider/selected.dart';
import 'package:sandboxed/sandboxed.dart';
import 'package:sandboxed/toolbar/toolbar.dart';
import 'package:sandboxed/widgets/element_name.dart';
import 'package:sandboxed/widgets/sb_share_button.dart';

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
                scrolledUnderElevation: 0,
                backgroundColor: Colors.transparent,
                actions: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 16.0,
                      right: context.breakpoint == Breakpoints.desktop
                          ? 8.0
                          : 16.0,
                    ),
                    child: const ActionChip(
                      // TODO(@melvspace): 03/06/25 navigate to docs.
                      // onPressed: () => AutoRouter.of(context).navigate(),
                      label: Text('Docs'),
                    ),
                  ),
                  if (context.breakpoint == Breakpoints.desktop)
                    const Padding(
                      padding: EdgeInsets.only(right: 16),
                      child: SBShareButton(),
                    ),
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
                listenable:
                    ref.watch(paramsProvider(ref.watch(paramsScopeIdProvider))),
                builder: (context, child) => StoryView(
                  meta: component.meta,
                  story: story,
                  params: ref
                      .watch(paramsProvider(ref.watch(paramsScopeIdProvider))),
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
