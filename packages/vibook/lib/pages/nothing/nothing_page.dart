import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:vibook/responsive/breakpoints.dart';
import 'package:vibook/widgets/element_name.dart';
import 'package:vibook/widgets/vi_bottom_app_bar.dart';

@RoutePage()
class NothingPage extends StatelessWidget {
  const NothingPage({super.key});

  @override
  Widget build(BuildContext context) {
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
        Breakpoints.mobile => const ViBottomAppBar(),
        _ => null,
      },
      body: const Center(
        child: Text('Nothing selected'),
      ),
    );
  }
}
