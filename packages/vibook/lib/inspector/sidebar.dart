import 'package:flutter/material.dart';
import 'package:vibook/widgets/story_name.dart';

class Sidebar extends StatelessWidget {
  final List<(Widget, Widget)> tabs;

  const Sidebar({
    super.key,
    required this.tabs,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 300),
      child: Card(
        child: DefaultTabController(
          length: tabs.length,
          child: Column(
            children: [
              AppBar(
                title: const StoryName(),
                backgroundColor: Colors.transparent,
              ),
              TabBar(
                tabs: [
                  for (final tab in tabs)
                    Tab(
                      child: tab.$1,
                    )
                ],
              ),
              Expanded(
                child: PageView(
                  children: [
                    tabs.firstOrNull?.$2 ?? const SizedBox(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
