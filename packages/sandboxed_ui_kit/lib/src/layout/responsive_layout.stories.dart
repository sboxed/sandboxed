import 'package:flutter/material.dart';
import 'package:sandboxed_core/sandboxed_core.dart';
import 'package:sandboxed_ui_kit/src/layout/responsive_layout.dart';
import 'package:sandboxed_ui_kit/src/widgets/layout/sb_drawer.stories.dart';
import 'package:sandboxed_ui_kit/src/widgets/layout/sb_sidebar.dart';

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
          sidebar: const SBSidebar(
            tabs: [(Tab(text: 'Addons'), Placeholder())],
          ),
        );
      },
    );
