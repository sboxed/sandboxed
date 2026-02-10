import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sandboxed/pages/document/document_page.dart';
import 'package:sandboxed/pages/nothing/nothing_page.dart';
import 'package:sandboxed/pages/story/story_page.dart';
import 'package:sandboxed/provider/params.dart';
import 'package:sandboxed/provider/persistence.dart';
import 'package:sandboxed/provider/selected.dart';
import 'package:sandboxed/routing/sandboxed_router_provider.dart';

class SandboxedViewport extends ConsumerWidget {
  const SandboxedViewport({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(selectedElementProvider);
    final id = ref.watch(selectedElementNotifierProvider);
    final pathPersistence = ref.read(pathPersistenceProvider.notifier);

    // Get current URL from router
    final currentUrl = context.currentUrl;
    if (currentUrl != null) {
      Future.microtask(() => pathPersistence.updatePath(currentUrl));
    }

    // Render the appropriate page based on selection with fade transition
    final page = switch (selected) {
      null => const NothingPage(key: ValueKey('nothing')),
      DocumentSelection() => DocumentPage(
          key: Key('document-$id'),
          id: id,
        ),
      StorySelection() => () {
          final params = ref.watch(paramsQueryProvider(id!));
          return StoryPage(
            key: Key('story-$id-$params'),
            id: id,
            params: params,
          );
        }(),
    };

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      switchInCurve: Curves.ease,
      switchOutCurve: Curves.ease,
      transitionBuilder: (child, animation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      child: page,
    );
  }
}
