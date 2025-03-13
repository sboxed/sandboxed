import 'package:flutter/material.dart';

class ViSidebar extends StatelessWidget {
  final List<(Widget, Widget)> tabs;

  const ViSidebar({
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
              TabBar(tabs: [for (final tab in tabs) Tab(child: tab.$1)]),
              Expanded(
                child: PageView(
                  children: [
                    for (final tab in tabs) //
                      tab.$2,
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
