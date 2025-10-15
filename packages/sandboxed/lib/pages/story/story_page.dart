import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_resizable_container/flutter_resizable_container.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sandboxed/inspector/component_inspector.dart';
import 'package:sandboxed/layout/story_viewport.dart';
import 'package:sandboxed/provider/params.dart';
import 'package:sandboxed/provider/settings.dart';
import 'package:sandboxed/widgets/sb_bottom_app_bar.dart';
import 'package:sandboxed_ui_kit/sandboxed_ui_kit.dart';

@RoutePage()
class StoryPage extends ConsumerWidget {
  final String? id;
  final String? params;

  const StoryPage({
    super.key,
    @QueryParam('path') this.id,
    @QueryParam() this.params,
    @QueryParam() String? global,
  }) : assert(id != null, 'id cant be null');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final id = this.id;
    final parentScaffold = Scaffold.maybeOf(context);

    if (id == null) {
      return Scaffold(
        body: ErrorWidget(
          StateError("Story ID not provided"),
        ),
        bottomNavigationBar: switch (context.breakpoint) {
          Breakpoints.mobile => SBBottomAppBar(scaffold: parentScaffold),
          _ => null,
        },
      );
    }

    return ProviderScope(
      overrides: [
        paramsScopeIdProvider.overrideWith((ref) => id),
      ],
      child: Scaffold(
        bottomNavigationBar: switch (context.breakpoint) {
          Breakpoints.mobile => SBBottomAppBar(scaffold: parentScaffold),
          _ => null,
        },
        body: LayoutBuilder(
          builder: (context, constraints) {
            final viewport = StoryViewport(id: id);
            switch (context.breakpoint) {
              case Breakpoints.mobile:
                return viewport;

              case Breakpoints.desktop:
                final positions = ref.watch(
                  settingStorageProvider.select((value) => value.positions),
                );

                return ResizableContainer(
                  direction: Axis.vertical,
                  children: [
                    ResizableChild(
                      size: const ResizableSize.expand(),
                      divider: buildResizableDivider(context),
                      child: viewport,
                    ),
                    if (positions.values.contains(PanelPosition.bottom))
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
                            child: ComponentInspector(
                              id: id,
                              position: PanelPosition.bottom,
                            ),
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
