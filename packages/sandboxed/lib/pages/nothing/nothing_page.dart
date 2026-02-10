import 'package:flutter/material.dart';
import 'package:sandboxed/widgets/element_name.dart';
import 'package:sandboxed/widgets/sb_bottom_app_bar.dart';
import 'package:sandboxed_ui_kit/sandboxed_ui_kit.dart';

class NothingPage extends StatelessWidget {
  const NothingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final parentScaffold = Scaffold.maybeOf(context);

    return Scaffold(
      appBar: switch (context.breakpoint) {
        Breakpoints.mobile => AppBar(
            title: const ElementName(),
            automaticallyImplyLeading: true,
            backgroundColor: Theme.of(context).colorScheme.surfaceContainerLow,
          ),
        _ => null,
      },
      bottomNavigationBar: switch (context.breakpoint) {
        Breakpoints.mobile => SBBottomAppBar(scaffold: parentScaffold),
        _ => null,
      },
      body: const Center(
        child: Text('Nothing selected'),
      ),
    );
  }
}
