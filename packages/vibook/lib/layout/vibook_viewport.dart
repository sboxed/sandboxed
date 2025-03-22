import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vibook/provider/addons.dart';
import 'package:vibook/provider/params.dart';
import 'package:vibook/provider/selected.dart';
import 'package:vibook/router.gr.dart';

class VibookViewport extends ConsumerWidget {
  const VibookViewport({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(selectedElementProvider);
    final id = ref.watch(selectedElementNotifierProvider);

    return AutoRouter.declarative(
      routes: (handler) {
        return [
          switch (selected) {
            null => NothingRoute(
                global: ref.watch(addonQueryProvider),
              ),
            DocumentSelection() => DocumentRoute(
                key: Key(id!),
                id: id,
                global: ref.watch(addonQueryProvider),
              ),
            StorySelection() => StoryRoute(
                key: Key(id!),
                id: id,
                global: ref.watch(addonQueryProvider),
                params: ref.watch(paramsQueryProvider(id)),
              ),
          },
        ];
      },
    );
  }
}
