import 'package:analyzer/dart/element/element.dart';
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
  final LibraryElement library;
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

  bool checkMeta(TopLevelVariableElement element) {
    if (element.type.element case ClassElement clazz) {
      // TODO(@melvspace): 03/06/25 typechecker is conflicting with flutter for some reason. investigate.
      return clazz.name == 'Meta' &&
          clazz.source.fullName == '/sandboxed_core/lib/meta.dart';
    }

    return false;
  }

  bool checkStory(TopLevelVariableElement element) {
    if (element.type.element case ClassElement clazz) {
      // TODO(@melvspace): 03/06/25 typechecker is conflicting with flutter for some reason. investigate.
      return clazz.name == 'Story' &&
          clazz.source.fullName == '/sandboxed_core/lib/story.dart';
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

  Reference get _meta {
    final meta = findMeta();
    return refer(meta?.name ?? 'meta', library.location!.encoding);
  }

  Future<MetaDescription?> buildMeta() async {
    final meta = findMeta();
    final parser = MetaParser(resolver: resolver);
    if (meta == null) return null;

    return parser.parse(meta);
  }

  Future<List<Expression>> buildStories(MetaDescription? meta) async {
    final parser = StoryParser(resolver: resolver, meta: meta);
    final stories = library.topLevelElements
        .whereType<TopLevelVariableElement>()
        .where(checkStory);

    final parsed = <String>{};
    final result = <(String, Expression)>[];
    for (final story in stories) {
      if (parsed.contains(story.name)) continue;

      final storyAccessor = await parser.parse(story);
      result.add((story.name, storyAccessor));
      parsed.add(story.name);
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
      metaDescription?.widget?.name ?? '_undefined_',
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
