import 'package:flutter/material.dart';
import 'package:sandboxed/addons/alignment/alignment_addon.dart';
import 'package:sandboxed/addons/banner/banner_addon.dart';
import 'package:sandboxed/addons/interactive_viewer/interactive_viewer_addon.dart';
import 'package:sandboxed/addons/safe_area/safe_area_addon.dart';
import 'package:sandboxed/addons/screenshot/screenshot_addon.dart';
import 'package:sandboxed/addons/split_themes/split_themes_addon.dart';
import 'package:sandboxed/addons/tags/tags_renderer_addon.dart';
import 'package:sandboxed/addons/viewport/viewport_addon.dart';
import 'package:sandboxed/feature_flags.dart';
import 'package:sandboxed/sandboxed.dart';
import 'package:sandboxed_sandbox/components.g.dart';
import 'package:sandboxed_sandbox/editors/custom_editors.dart';

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
        flags: const {FeatureFlags.elementTreeNext},
        addons: [
          // Editor
          TagsRendererAddon(
            buildTag: (context, tag) => switch (tag) {
              'deprecated' =>
                const TagChip(tag: Text('Deprecated'), color: Colors.red),
              'new' => const TagChip(tag: Text('New'), color: Colors.green),
              'unimplemented' =>
                const TagChip(tag: Text('Unimplemented'), color: Colors.yellow),
              _ => null,
            },
          ),

          // Editors
          CustomEditorsAddon(),

          // Decorators
          BannerAddon(label: 'sandbox'),
          SplittedThemesAddon(),
          InteractiveViewerAddon(constrained: false),
          ViewportAddon(devices: Devices.ios.all),

          // TimeDilationAddon(),
          // ThemeAddon<AFIThemeMode>(
          //   {
          //     "System": AFIThemeMode.system,
          //     "Light": AFIThemeMode.light,
          //     "Dark": AFIThemeMode.dark,
          //   },
          //   (context, theme, child) {
          //     if (theme == AFIThemeMode.system) {
          //       return Provider<ResponsiveStateProvider>.value(
          //         value: WidgetbookResponsiveStateProvider(
          //           data: MediaQuery.of(context),
          //         ),
          //         child: Scaffold(body: child),
          //       );
          //     }

          //     return Provider<ResponsiveStateProvider>.value(
          //       value: WidgetbookResponsiveStateProvider(
          //         data: MediaQuery.of(context),
          //       ),
          //       child: child,
          //       builder: (context, child) {
          //         final spacing = const ResponsiveDimensions(
          //           mobile: mobileSpacing,
          //           tablet: tabletSpacing,
          //         ).resolve(context);

          //         return Theme(
          //           data: switch (theme) {
          //             AFIThemeMode.light =>
          //               createLightThemeData(spacing: spacing),
          //             AFIThemeMode.dark => createDarkThemeData(spacing: spacing),
          //             _ => ThemeData(),
          //           },
          //           child: Scaffold(
          //             body: child ?? const SizedBox.shrink(),
          //           ),
          //         );
          //       },
          //     );
          //   },
          // ),

          SafeAreaAddon(),
          AlignmentAddon(),
          ScreenshotAddon(),
        ],
      ),
    );
  }
}
