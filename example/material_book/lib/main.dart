import 'package:flutter/material.dart';
import 'package:material_book/components.g.dart';
import 'package:sandboxed/addons/alignment/alignment_addon.dart';
import 'package:sandboxed/addons/interactive_viewer/interactive_viewer_addon.dart';
import 'package:sandboxed/addons/safe_area/safe_area_addon.dart';
import 'package:sandboxed/sandboxed.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sandboxed(
      title: Text("Material"),
      brandColor: Colors.blue,
      components: components,
      addons: [
        InteractiveViewerAddon(constrained: true),
        SafeAreaAddon(),
        AlignmentAddon(),
      ],
    );
  }
}
