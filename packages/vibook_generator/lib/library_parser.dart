import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:collection/collection.dart';
import 'package:vibook_generator/parsers/meta_parser.dart';
import 'package:vibook_generator/story_parser.dart';

class LibraryParser {
  final Resolver resolver;

  final String package;
  final String path;
  final LibraryElement library;
  final List<String> docs;

  LibraryParser({
    required this.resolver,
    required this.package,
    required this.path,
    required this.library,
    required this.docs,
  });

  String get _id {
    return path //
        .replaceAll('lib/', '')
        .replaceAll('/', '_')
        .split('.')
        .first;
  }

  Directive get import {
    return Directive.import(
      'package:$package/${path.replaceAll('lib/', '')}',
      as: _id, //
    );
  }

  bool checkMeta(TopLevelVariableElement element) {
    if (element.type.element case ClassElement clazz) {
      // TODO(@melvspace): 03/06/25 typechecker is conflicting with flutter for some reason. investigate.
      return clazz.name == 'Meta' &&
          clazz.source.fullName == '/vibook_core/lib/meta.dart';
    }

    return false;
  }

  bool checkStory(TopLevelVariableElement element) {
    if (element.type.element case ClassElement clazz) {
      // TODO(@melvspace): 03/06/25 typechecker is conflicting with flutter for some reason. investigate.
      return clazz.name == 'Story' &&
          clazz.source.fullName == '/vibook_core/lib/story.dart';
    }

    return false;
  }

  TopLevelVariableElement? findMeta() {
    for (final element in library.topLevelElements) {
      if (element case TopLevelVariableElement element) {
        if (checkMeta(element)) {
          return element;
        }
      }
    }

    return null;
  }

  String get _meta {
    final meta = findMeta();
    return meta?.name ?? 'meta';
  }

  Future<MetaDescription?> buildMeta() async {
    final meta = findMeta();
    final parser = MetaParser(resolver: resolver);
    if (meta == null) return null;

    return parser.parse(meta);
  }

  Future<List<String>> buildStories(MetaDescription? meta) async {
    final parser = StoryParser(resolver: resolver, meta: meta);
    final stories = library.topLevelElements
        .whereType<TopLevelVariableElement>()
        .where(checkStory);

    final parsed = <String>{};
    final result = <String>[];
    for (final story in stories) {
      if (parsed.contains(story.name)) continue;

      final storyAccessor = await parser.parse(story);
      result.add('$_id.$storyAccessor');
      parsed.add(story.name);
    }

    return result;
  }

  Future<(Set<LibraryElement>, Code)> build() async {
    final metaDescription = await buildMeta();
    final stories = await buildStories(metaDescription);

    final metaIdentifier = '$_id.$_meta';
    final storiesComma = stories.isNotEmpty ? ',' : '';

    return (
      metaDescription?.libraries ?? <LibraryElement>{},
      Code(
        '''
Component(
  meta: $metaIdentifier${withDocs(metaIdentifier, docs)},
  stories: [${stories.join(',')}$storiesComma],
)
''',
      )
    );
  }

  String withDocs(String metaIdentifier, List<String> docs) {
    if (docs.isEmpty) return '';

    final docsComma = docs.isNotEmpty ? ',' : '';

    return '''
.copyWith(
  documentation: [
    ...$metaIdentifier.documentation,
    ${docs.mapIndexed(
              (i, e) =>
                  "DocumentEntry(name: 'Docs${docs.length > 1 ? ' $i' : ''}',"
                  "content: '''$e''')",
            ).join(', ')}$docsComma
  ],
)
''';
  }
}
