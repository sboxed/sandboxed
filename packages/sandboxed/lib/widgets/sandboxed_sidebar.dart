import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sandboxed/inspector/component_inspector.dart';
import 'package:sandboxed/provider/selected.dart';
import 'package:sandboxed/provider/settings.dart';

class SandboxedSidebar extends ConsumerWidget {
  const SandboxedSidebar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final id = ref.watch(selectedElementNotifierProvider);

    if (id != null) {
      return Card(
        child: ComponentInspector(
          id: id,
          position: PanelPosition.right,
        ),
      );
    }

    return const SizedBox();
  }
}
