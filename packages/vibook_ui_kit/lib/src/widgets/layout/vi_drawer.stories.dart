import 'package:flutter/material.dart';
import 'package:vibook_core/vibook_core.dart';
import 'package:vibook_ui_kit/src/widgets/tiles/element_tile.stories.dart';
import 'package:vibook_ui_kit/vibook_ui_kit.dart';

Meta get meta => const Meta<ViDrawer>(name: 'Drawer');

Story get $Drawer => Story(
      builder: (context, params) {
        return ViDrawer(
          title: Text(params.string('title').required('VIBOOK')),
          actions: [ViThemeButton(value: ThemeMode.dark, onPressed: () {})],
          body: StoryView(
            params: params,
            story: $Tree,
          ),
        );
      },
    );
