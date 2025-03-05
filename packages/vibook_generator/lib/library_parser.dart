import 'package:code_builder/code_builder.dart';
import 'package:collection/collection.dart';

// TODO(@melvspace): 03/05/25 where analyzer?
class LibraryParser {
  final String package;
  final String path;
  final String code;
  final String? docs;

  LibraryParser({
    required this.package,
    required this.path,
    required this.code,
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
      as: _id,
    );
  }

  String get _meta {
    final match = RegExp(r'([A-z$][_$A-z\d]+)\s+=>?\s+Meta(<[A-z\d_$]+>)?\(') //
        .firstMatch(code);

    if (match?.group(1) case String meta) {
      return meta;
    }

    throw StateError('Unable to find Meta provider');
  }

  List<String> get _stories {
    final matches = RegExp(r'([A-z$][_$A-z\d]+)\s+=>?\s+Story\(') //
        .allMatches(code);

    return [
      for (final match in matches) //
        '() => $_id.${match.group(1)}',
    ];
  }

  Code build() {
    return Code(
      '''
Component(
  meta: () => $_id.$_meta${withDocs('$_id.$_meta', [
            if (docs case String docs) docs
          ])},
  stories: [${_stories.join(',')},],
)
''',
    );
  }

  String withDocs(String metaIdentifier, List<String> docs) {
    if (docs.isEmpty) return '';

    return '''.copyWith(
      documentation: [
        ...$metaIdentifier.documentation,
        ${docs.mapIndexed(
              (i, e) =>
                  "DocumentEntry(name: 'Docs${docs.length > 1 ? ' $i' : ''}', "
                  "content: '''$e''')",
            ).join(', ')},
      ],
    )
''';
  }
}
