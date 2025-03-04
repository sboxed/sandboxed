import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vibook/provider/addons.dart';
import 'package:vibook/provider/selected.dart';
import 'package:vibook/widgets/story_name.dart';
import 'package:vibook/widgets/vi_drawer.dart';
import 'package:vibook_core/component.dart';
import 'package:vibook_core/story.dart';
import 'package:vibook_core/story_view.dart';

class MobileLayout extends StatefulWidget {
  final List<Component> components;

  const MobileLayout({
    super.key,
    required this.components,
  });

  @override
  State<MobileLayout> createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return Scaffold(
          appBar: AppBar(
            title: const StoryName(),
            backgroundColor: Colors.transparent,
          ),
          drawer: const ViDrawer(),
          endDrawer: Drawer(
            child: Column(
              children: [
                AppBar(
                  automaticallyImplyLeading: false,
                  title: const StoryName(),
                  actions: const [CloseButton()],
                  backgroundColor: Colors.transparent,
                ),
              ],
            ),
          ),
          body: Column(
            children: [
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
        );
      },
    );
  }
}
