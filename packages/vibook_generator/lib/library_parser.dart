import 'package:code_builder/code_builder.dart';

// TODO(@melvspace): 03/05/25 where analyzer?
class LibraryParser {
  final String package;
  final String path;
  final String code;

  LibraryParser({
    required this.package,
    required this.path,
    required this.code,
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

  List<String> get _stories {
    final matches = RegExp(r'([A-z$][_$A-z\d]+)\s+=>\s+Story\(') //
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
  meta: () => $_id.meta,
  stories: [${_stories.join(',')},],
)
''',
    );
  }
}
