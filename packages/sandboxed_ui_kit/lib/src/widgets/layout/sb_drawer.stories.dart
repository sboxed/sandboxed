import 'package:flutter/material.dart';
import 'package:sandboxed_core/sandboxed_core.dart';
import 'package:sandboxed_ui_kit/sandboxed_ui_kit.dart';
import 'package:sandboxed_ui_kit/src/widgets/tiles/element_tile.stories.dart';

Meta get meta => const Meta<SBDrawer>(name: 'Drawer');

Story get $Drawer => Story(
      builder: (context, params) {
        return SBDrawer(
          title: Text(params.string('title').required('Sandboxed')),
          actions: [SBThemeButton(value: ThemeMode.dark, onPressed: () {})],
          body: StoryView(
            params: params,
            story: $Tree,
          ),
        );
      },
    );
