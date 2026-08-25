import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sandboxed/provider/component_tree.dart';
import 'package:sandboxed_core/component.dart';
import 'package:sandboxed_core/tags_resolver.dart';

Set<String> globalTags(Ref ref) {
  return {};
}

TagsResolver tagsResolver(Ref ref) {
  return TagsResolver(globalTags: ref.watch(globalTagsProvider));
}

Set<String> allTags(Ref ref) {
  final tags = {...ref.watch(globalTagsProvider)};
  final components = ref.watch(componentsProvider);
  for (final element in components) {
    switch (element) {
      case Component component:
        tags.addAll(
          component.meta.tags.map(
            (e) => e.replaceAll(RegExp('^!'), ''),
          ),
        );

        for (final story in component.stories) {
          tags.addAll(
            story.tags.map(
              (e) => e.replaceAll(RegExp('^!'), ''),
            ),
          );
        }
    }
  }

  return tags;
}

final globalTagsProvider = Provider.autoDispose<Set<String>>(globalTags);

final tagsResolverProvider = Provider.autoDispose<TagsResolver>(tagsResolver);

final allTagsProvider = Provider.autoDispose<Set<String>>(
  allTags,
  dependencies: [componentsProvider],
);

final tagFilterProvider =
    NotifierProvider.autoDispose<TagFilter, Set<String>>(TagFilter.new);

class TagFilter extends Notifier<Set<String>> {
  @override
  Set<String> build() {
    return {};
  }

  void toggle(String id) {
    if (!state.contains(id)) {
      state.add(id);
    } else {
      state.remove(id);
    }

    ref.notifyListeners();
  }
}
