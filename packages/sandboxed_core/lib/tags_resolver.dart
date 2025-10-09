import 'package:sandboxed_core/component.dart';
import 'package:sandboxed_core/story.dart';

class TagsResolver {
  final Set<String> globalTags;

  TagsResolver({required this.globalTags});

  bool checkTag(String tag, Component component, [Story? story]) {
    final tags = resolveTags(component, story);
    return tags.contains(tag);
  }

  Set<String> resolveTags(Component component, [Story? story]) {
    var tags = {...globalTags};
    tags = modify(tags, component.meta.tags);
    if (story != null) {
      tags = modify(tags, story.tags);
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
