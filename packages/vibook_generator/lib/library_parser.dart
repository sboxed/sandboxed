import 'package:analyzer/dart/element/element.dart';
import 'package:code_builder/code_builder.dart';
import 'package:collection/collection.dart';

class LibraryParser {
  final String package;
  final String path;
  final LibraryElement library;
  final String? docs;

  LibraryParser({
    required this.package,
    required this.path,
    required this.library,
    this.docs,
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

  String get _meta {
    for (final element in library.topLevelElements) {
      if (element case TopLevelVariableElement element) {
        if (checkMeta(element)) {
          return element.name;
        }
      }
    }

    return 'meta';
  }

  List<String> get _stories {
    final stories = library.topLevelElements
        .whereType<TopLevelVariableElement>()
        .where(checkStory);

    return [
      for (final story in stories) //
        '$_id.${story.name}',
    ];
  }

  Code build() {
    final metaIdentifier = '$_id.$_meta';
    return Code(
      '''
Component(
  meta: $metaIdentifier${withDocs(metaIdentifier, [
            if (docs case String docs) docs
          ])},
  stories: [${_stories.join(',')}],
)
''',
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
