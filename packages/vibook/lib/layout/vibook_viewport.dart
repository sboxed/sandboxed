import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vibook/provider/selected.dart';
import 'package:vibook/router.gr.dart';

class VibookViewport extends ConsumerWidget {
  const VibookViewport({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AutoRouter.declarative(
      routes: (handler) => [
        switch (ref.watch(selectedElementProvider)) {
          null => const NothingRoute(),
          DocumentSelection() => DocumentRoute(
              id: ref.watch(selectedElementNotifierProvider)!,
            ),
          StorySelection() => StoryRoute(
              id: ref.watch(selectedElementNotifierProvider)!,
            ),
        },
      ],
    );
  }
}
