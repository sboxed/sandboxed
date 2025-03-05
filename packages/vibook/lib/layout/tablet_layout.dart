import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_resizable_container/flutter_resizable_container.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vibook/inspector/addons_inspector.dart';
import 'package:vibook/provider/selected.dart';
import 'package:vibook/router.gr.dart';
import 'package:vibook/widgets/sidebar.dart';
import 'package:vibook/widgets/vi_drawer.dart';
import 'package:vibook_core/component.dart';

class TabletLayout extends StatefulWidget {
  final List<ViElement> components;

  const TabletLayout({super.key, required this.components});

  @override
  State<TabletLayout> createState() => _TabletLayoutState();
}

class _TabletLayoutState extends State<TabletLayout> {
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
                  builder: (context, ref, child) => AutoRouter.declarative(
                    routes: (handler) => [
                      switch (ref.watch(selectedElementProvider)) {
                        null => StoryRoute(id: null),
                        DocumentSelection() => DocumentRoute(
                            id: ref.watch(selectedElementNotifierProvider)!,
                          ),
                        StorySelection() => StoryRoute(
                            id: ref.watch(selectedElementNotifierProvider),
                          ),
                      },
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
