import 'package:flutter/material.dart';
import 'package:vibook_core/vibook_core.dart';
import 'package:vibook_ui_kit/src/layout/responsive_layout.dart';
import 'package:vibook_ui_kit/src/widgets/layout/vi_drawer.stories.dart';
import 'package:vibook_ui_kit/src/widgets/layout/vi_sidebar.dart';

Meta get meta => Meta<ResponsiveLayout>(
      name: 'Responsive Layout',
      module: 'Layout',
      decorators: [
        Decorator(
          (context, story) => Padding(
            padding: const EdgeInsets.all(16),
            child: story,
          ),
        )
      ],
    );

Story get $Default => Story(
      builder: (context, params) {
        return ResponsiveLayout(
          drawer: StoryView(
            story: $Drawer,
          ),
          viewport: const Placeholder(),
          sidebar: const ViSidebar(
            tabs: [(Tab(text: 'Addons'), Placeholder())],
          ),
        );
      },
    );
