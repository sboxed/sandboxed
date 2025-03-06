import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_resizable_container/flutter_resizable_container.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vibook/inspector/component_inspector.dart';
import 'package:vibook/layout/story_viewport.dart';
import 'package:vibook/params/params_notifier.dart';
import 'package:vibook/provider/params.dart';
import 'package:vibook/responsive/breakpoints.dart';
import 'package:vibook/widgets/element_name.dart';
import 'package:vibook/widgets/resizable_divider.dart';
import 'package:vibook/widgets/vi_bottom_app_bar.dart';

@RoutePage()
class StoryPage extends ConsumerWidget {
  final String id;

  const StoryPage({
    super.key,
    @PathParam() required this.id,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProviderScope(
      overrides: [
        paramsProvider.overrideWith((ref) => ParamsNotifier()),
      ],
      child: Scaffold(
        appBar: switch (context.breakpoint) {
          Breakpoints.mobile => AppBar(
              title: ElementName(id: id),
              automaticallyImplyLeading: true,
              backgroundColor:
                  Theme.of(context).colorScheme.surfaceContainerLow,
            ),
          _ => null,
        },
        bottomNavigationBar: switch (context.breakpoint) {
          Breakpoints.mobile => const ViBottomAppBar(),
          _ => null,
        },
        body: LayoutBuilder(
          builder: (context, constraints) {
            final viewport = StoryViewport(id: id);
            switch (context.breakpoint) {
              case Breakpoints.mobile:
                return viewport;

              case Breakpoints.desktop:
                return ResizableContainer(
                  key: ValueKey(constraints.maxHeight),
                  direction: Axis.vertical,
                  children: [
                    ResizableChild(
                      size: const ResizableSize.expand(),
                      divider: buildResizableDivider(context),
                      child: viewport,
                    ),
                    ResizableChild(
                      divider: buildResizableDivider(context),
                      size: ResizableSize.ratio(
                        1 / 3,
                        min: 200,
                        max: constraints.maxHeight * 2 / 3,
                      ),
                      child: SizedBox(
                        height: double.infinity,
                        child: Card(
                          child: ComponentInspector(id: id),
                        ),
                      ),
                    ),
                  ],
                );
            }
          },
        ),
      ),
    );
  }
}
