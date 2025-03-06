import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_resizable_container/flutter_resizable_container.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vibook/inspector/component_inspector.dart';
import 'package:vibook/layout/story_viewport.dart';
import 'package:vibook/responsive/breakpoints.dart';
import 'package:vibook/widgets/resizable_divider.dart';

// TODO(@melvspace): 03/05/25 add id

@RoutePage()
class StoryPage extends ConsumerWidget {
  final String? id;

  const StoryPage({
    super.key,
    @PathParam() required this.id,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          switch (context.breakpoint) {
            case Breakpoints.mobile:
              return const StoryViewport();

            case Breakpoints.desktop:
              return ResizableContainer(
                key: ValueKey(constraints.maxHeight),
                direction: Axis.vertical,
                children: [
                  ResizableChild(
                    size: const ResizableSize.expand(),
                    divider: buildResizableDivider(context),
                    child: const StoryViewport(),
                  ),
                  ResizableChild(
                    divider: buildResizableDivider(context),
                    size: ResizableSize.ratio(
                      1 / 3,
                      min: 200,
                      max: constraints.maxHeight * 2 / 3,
                    ),
                    child: const SizedBox(
                      height: double.infinity,
                      child: Card(
                        child: ComponentInspector(),
                      ),
                    ),
                  ),
                ],
              );
          }
        },
      ),
    );
  }
}
