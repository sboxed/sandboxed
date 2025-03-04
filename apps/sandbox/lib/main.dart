import 'package:flutter/material.dart';
import 'package:vibook/addons/alignment/alignment_addon.dart';
import 'package:vibook/addons/interactive_viewer_addon/interactive_viewer_addon.dart';
import 'package:vibook/addons/safe_area/safe_area_addon.dart';
import 'package:vibook/vibook.dart';
import 'package:vibook_sandbox/components.book.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Vibook(
      components: components,
      addons: [
        InteractiveViewerAddon(constrained: false),
        SafeAreaAddon(),
        AlignmentAddon(),
      ],
    );
  }
}
