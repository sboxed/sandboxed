import 'package:flutter/material.dart';
import 'package:sandboxed/addons/alignment/alignment_addon.dart';
import 'package:sandboxed/addons/banner/banner_addon.dart';
import 'package:sandboxed/addons/interactive_viewer/interactive_viewer_addon.dart';
import 'package:sandboxed/addons/safe_area/safe_area_addon.dart';
import 'package:sandboxed/addons/split_themes/split_themes_addon.dart';
import 'package:sandboxed/addons/tags/tags_renderer_addon.dart';
import 'package:sandboxed/addons/viewport/viewport_addon.dart';
import 'package:sandboxed/sandboxed.dart';
import 'package:sandboxed_library/components.g.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaler: const TextScaler.linear(1.0),
      ),
      child: Sandboxed(
        components: components,
        addons: [
          // Editor
          TagsRendererAddon(
            buildTag: (context, tag) => switch (tag) {
              'deprecated' =>
                const TagChip(tag: Text('Deprecated'), color: Colors.red),
              'new' => const TagChip(tag: Text('New'), color: Colors.green),
              _ => null,
            },
          ),

          // Decorators
          BannerAddon(label: 'sandbox'),
          SplittedThemesAddon(),
          InteractiveViewerAddon(constrained: false),
          ViewportAddon(devices: Devices.ios.all),

          SafeAreaAddon(),
          AlignmentAddon(),
        ],
      ),
    );
  }
}
