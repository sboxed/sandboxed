import 'package:flutter/material.dart';
import 'package:flutter_resizable_container/flutter_resizable_container.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vibook/inspector/addons_inspector.dart';
import 'package:vibook/inspector/sidebar.dart';
import 'package:vibook/provider/addons.dart';
import 'package:vibook/provider/selected.dart';
import 'package:vibook/toolbar/toolbar.dart';
import 'package:vibook/widgets/vi_drawer.dart';
import 'package:vibook_core/component.dart';
import 'package:vibook_core/story.dart';
import 'package:vibook_core/story_view.dart';

class TabletLayout extends StatefulWidget {
  final List<Component> components;

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
      body: ResizableContainer(
        children: [
          ResizableChild(
            divider: divider,
            size: const ResizableSize.pixels(300, min: 300),
            child: const ViDrawer(),
          ),
          ResizableChild(
            divider: divider,
            size: const ResizableSize.expand(),
            child: Consumer(
              builder: (context, ref, child) => Column(
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
              ),
            ),
          ),
          ResizableChild(
            divider: divider,
            size: const ResizableSize.pixels(300, min: 300),
            child: Sidebar(
              tabs: [
                (Text('Addons'), AddonsInspector()),
              ],
            ),
          ),
        ],
        direction: Axis.horizontal,
      ),
    );

    return Scaffold(
      body: Row(
        children: [],
      ),
    );
  }
}
