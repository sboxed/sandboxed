import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
        final pending = handler.initialPendingRoutes ?? [];
        if (pending.isNotEmpty) {
          final route = pending.first;
          final params = route.queryParams;

          if ({StoryRoute.name, DocumentRoute.name}.contains(route.routeName)) {
            if (params.getString('path') case String path) {
              Future.microtask(
                () => ref
                    .read(selectedElementNotifierProvider.notifier)
                    .select(path),
              );

              return [];
            }
          }
        }

        return [
          switch (selected) {
            null => const NothingRoute(),
            DocumentSelection() => DocumentRoute(
                key: Key(id!),
                id: id,
              ),
            StorySelection() => StoryRoute(
                key: Key(id!),
                id: id,
              ),
          },
        ];
      },
    );
  }
}
