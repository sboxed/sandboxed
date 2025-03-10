import 'package:vibook_core/component.dart';
import 'package:vibook_core/story.dart';

class TagsResolver {
  final Set<String> globalTags;

  TagsResolver({required this.globalTags});

  bool checkTag(String tag, Component component, Story? story) {
    final tags = resolveTags(component, story);
    return tags.contains(tag);
  }

  Set<String> resolveTags(Component component, Story? story) {
    final tags = {...globalTags};
    modify(tags, component.meta.tags);
    if (story != null) {
      modify(tags, story.tags);
    }

    return tags;
  }

  Set<String> modify(Set<String> tags, Iterable<String> modifier) {
    final result = {...tags};

    final addTags = modifier.where((element) => !element.startsWith('!'));
    final removeTags = modifier
        .where((element) => element.startsWith('!'))
        .map((e) => e.substring(1));

    result.removeAll(removeTags);
    result.addAll(addTags);

    return result;
  }
}
