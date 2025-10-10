import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sandboxed/provider/component_tree.dart';
import 'package:sandboxed_core/component.dart';
import 'package:sandboxed_core/tags_resolver.dart';

part 'tags.g.dart';

@riverpod
Set<String> globalTags(Ref ref) {
  return {};
}

@riverpod
TagsResolver tagsResolver(Ref ref) {
  return TagsResolver(globalTags: ref.watch(globalTagsProvider));
}

@Riverpod(dependencies: [components])
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

@riverpod
class TagFilter extends _$TagFilter {
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
