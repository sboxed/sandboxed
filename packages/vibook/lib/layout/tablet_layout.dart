import 'package:flutter/material.dart';
import 'package:flutter_resizable_container/flutter_resizable_container.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vibook/inspector/addons_inspector.dart';
import 'package:vibook/inspector/component_inspector.dart';
import 'package:vibook/layout/story_viewport.dart';
import 'package:vibook/widgets/sidebar.dart';
import 'package:vibook/widgets/vi_drawer.dart';
import 'package:vibook_core/component.dart';

class TabletLayout extends StatefulWidget {
  final List<Component> components;

  const TabletLayout({super.key, required this.components});

  @override
  State<TabletLayout> createState() => _TabletLayoutState();
}

class _TabletLayoutState extends State<TabletLayout> {
  late final GlobalKey _viewportKey = GlobalKey();
  late final GlobalKey _bottomBarKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final divider = ResizableDivider(
      color: Theme.of(context).colorScheme.surfaceContainer,
      thickness: 5,
    );

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return ResizableContainer(
            children: [
              ResizableChild(
                divider: divider,
                size: const ResizableSize.pixels(300, min: 300),
                child: const ViDrawer(),
              ),
              ResizableChild(
                divider: divider,
                size: const ResizableSize.expand(min: 300),
                child: Consumer(
                  builder: (context, ref, child) => ResizableContainer(
                    key: ValueKey(constraints.maxHeight),
                    direction: Axis.vertical,
                    children: [
                      ResizableChild(
                        size: const ResizableSize.expand(),
                        divider: divider,
                        child: KeyedSubtree(
                          key: _viewportKey,
                          child: const StoryViewport(),
                        ),
                      ),
                      ResizableChild(
                        // key:
                        divider: divider,
                        size: ResizableSize.ratio(
                          1 / 3,
                          min: 200,
                          max: constraints.maxHeight * 2 / 3,
                        ),
                        child: KeyedSubtree(
                          key: _bottomBarKey,
                          child: const SizedBox(
                            height: double.infinity,
                            child: Card(
                              child: ComponentInspector(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ResizableChild(
                divider: divider,
                size: const ResizableSize.pixels(300, min: 300),
                child: const Sidebar(
                  tabs: [
                    (Text('Addons'), AddonsInspector()),
                  ],
                ),
              ),
            ],
            direction: Axis.horizontal,
          );
        },
      ),
    );
  }
}
