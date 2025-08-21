import 'package:analyzer/dart/element/element2.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:collection/collection.dart';
import 'package:recase/recase.dart';
import 'package:sandboxed_generator/config/aggregator_config.dart';
import 'package:sandboxed_generator/extension/escape_identifier_x.dart';
import 'package:sandboxed_generator/parsers/meta_parser.dart';
import 'package:sandboxed_generator/parsers/story_parser.dart';

class LibraryParser {
  final Resolver resolver;
  final AggregatorConfig config;

  final bool isRootPackage;
  final String package;
  final String path;
  final LibraryElement2 library;
  final List<String> docs;
  final Reference? configReference;

  LibraryParser({
    required this.resolver,
    required this.isRootPackage,
    required this.package,
    required this.path,
    required this.library,
    required this.docs,
    required this.config,
    required this.configReference,
  });

  bool checkMeta(TopLevelVariableElement2 element) {
    if (element.type.element3 case ClassElement2 clazz) {
      // TODO(@melvspace): 03/06/25 typechecker is conflicting with flutter for some reason. investigate.
      return clazz.name3 == 'Meta' &&
          clazz.library2.uri.toString().contains('sandboxed_core/meta.dart');
    }

    return false;
  }

  bool checkStory(TopLevelVariableElement2 element) {
    if (element.type.element3 case ClassElement2 clazz) {
      // TODO(@melvspace): 03/06/25 typechecker is conflicting with flutter for some reason. investigate.
      return clazz.name3 == 'Story' &&
          clazz.library2.uri.toString().contains('sandboxed_core/story.dart');
    }

    return false;
  }

  TopLevelVariableElement2? findMeta() {
    for (final element in library.topLevelVariables) {
      print(library.topLevelVariables);
      if (checkMeta(element)) {
        return element;
      }
    }

    return null;
  }

  Reference get _meta {
    final meta = findMeta();
    print([meta, meta?.name3]);
    return refer(meta?.name3 ?? 'meta', library.uri.toString());
  }

  Future<MetaDescription?> buildMeta() async {
    final meta = findMeta();
    final parser = MetaParser(resolver: resolver);
    if (meta == null) return null;

    return parser.parse(meta);
  }

  Future<List<Expression>> buildStories(MetaDescription? meta) async {
    final parser = StoryParser(resolver: resolver, meta: meta);
    final stories = library.topLevelVariables
        .whereType<TopLevelVariableElement2>()
        .where(checkStory);

    final parsed = <String>{};
    final result = <(String, Expression)>[];
    for (final story in stories) {
      if (parsed.contains(story.name3)) continue;

      final storyAccessor = await parser.parse(story);
      final name = story.name3;
      if (name == null) {
        throw ArgumentError.notNull('story.name3');
      }

      result.add((name, storyAccessor));
      parsed.add(name);
    }

    return result //
        .sortedBy((it) => it.$1)
        .map((it) => it.$2)
        .toList();
  }

  Future<(String, Spec)> build() async {
    final metaDescription = await buildMeta();
    final stories = await buildStories(metaDescription);
    final meta = _meta;

    final configReference = this.configReference ??
        InvokeExpression.newOf(
          refer('Config'),
          [],
          {
            'module': literalString(
              '${config.packagesModuleName}/${package.titleCase}',
            ),
          },
        );

    return (
      metaDescription?.widget?.name3 ?? '_undefined_',
      InvokeExpression.newOf(
        refer('Component'),
        [],
        {
          'meta': withDocs(meta, docs),
          if (this.configReference != null || !isRootPackage) //
            'config': configReference,
          'stories': literalList([
            for (final story in stories) //
              story,
          ]),
        },
      )
    );
  }

  Expression withDocs(Reference meta, List<String> docs) {
    if (docs.isEmpty) return meta;

    return meta.property('copyWith').call(
      [],
      {
        'documentation': literalList([
          meta.property('documentation').spread,
          for (final (i, doc) in docs.indexed)
            InvokeExpression.newOf(
              refer('DocumentEntry'),
              [],
              {
                'name': CodeExpression(
                  Code("'Docs${docs.length > 1 ? ' $i' : ''}'"),
                ),
                'content': literalString(doc.escaped),
              },
            ),
        ]),
      },
    );
  }
}
