import 'dart:async';
import 'dart:convert';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:vibook_generator/docs_cleaner.dart';
import 'package:vibook_generator/library_parser.dart';

class StoryContainer {
  final String path;
  final String package;
  final LibraryElement library;
  final List<String> docs;

  StoryContainer({
    required this.package,
    required this.path,
    required this.library,
    required this.docs,
  });

  String get id => '$package/$path'.split('/').last.split('.').first;
}

class PackageStories {
  final String package;
  final List<StoryContainer> storyContainers;

  const PackageStories({
    required this.package,
    required this.storyContainers,
  });
}

class ComponentAggregateBuilder extends Builder {
  final String output = 'components.g.dart';

  @override
  Map<String, List<String>> get buildExtensions => {
        r'$lib$': [output],
      };

  Future<String?> findDocs(BuildStep buildStep, AssetId target) async {
    final docAsset = AssetId(
      target.package,
      target.path.replaceAll('.stories.dart', '.mdx'),
    );

    print('Searching docs for ${target.path}');

    if (await buildStep.canRead(docAsset)) {
      var content = await buildStep.readAsString(docAsset);
      content = DocsCleaner().clean(content);
      return content; //
    }

    return null;
  }

  @override
  Future<void> build(BuildStep buildStep) async {
    final outputAsset = AssetId(buildStep.inputId.package, 'lib/$output');
    final List<PackageStories> packageStories = [];

    final packages = {
      buildStep.inputId.package,
      ...(await buildStep.packageConfig).packages.map((e) => e.name),
    };

    for (final package in packages) {
      final asset = AssetId(package, 'lib/stories.json');
      if (await buildStep.canRead(asset) == false) continue;

      final jsonContent = await buildStep.readAsString(asset);
      final storyContainerPaths = (jsonDecode(jsonContent) as List) //
          .cast<String>();

      final storyContainers = <StoryContainer>[];

      for (final path in storyContainerPaths) {
        final asset = AssetId(package, path);
        final library = await buildStep.resolver.libraryFor(asset);
        final docs = await findDocs(buildStep, asset);

        storyContainers.add(
          StoryContainer(
            path: path,
            package: package,
            library: library,
            docs: [if (docs case String docs) docs],
          ),
        );
      }

      if (storyContainers.isNotEmpty) {
        packageStories.add(
          PackageStories(
            package: package,
            storyContainers: storyContainers,
          ),
        );
      }
    }

    List<Directive> directives = [];
    List<Code> components = [];
    for (final package in packageStories) {
      for (final storyContainer in package.storyContainers) {
        final parser = LibraryParser(
          resolver: buildStep.resolver,
          package: package.package,
          path: storyContainer.path,
          library: storyContainer.library,
          docs: storyContainer.docs,
        );

        directives.add(parser.import);
        final result = await parser.build();
        directives.addAll(
          result.$1
              .map((e) => e.location?.encoding)
              .whereType<String>()
              .map(Directive.import),
        );

        components.add(result.$2);
      }
    }

    final library = Library(
      (library) {
        library.comments.addAll([
          'coverage:ignore-file',
          'GENERATED CODE - DO NOT MODIFY BY HAND',
          'ignore_for_file: type=lint',
          'ignore_for_file: invalid_use_of_visible_for_testing_member, unused_import, duplicate_import, unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark',
        ]);

        library.directives
            .add(Directive.import('package:vibook_core/vibook_core.dart'));
        library.directives
            .add(Directive.import('package:flutter/material.dart'));

        library.directives.addAll(directives);

        final componentsField = Method(
          (method) {
            method
              ..name = 'components'
              ..lambda = true
              ..type = MethodType.getter
              ..returns = refer('List<Component>')
              ..body = literalList(components, refer('Component')).code;
          },
        );

        library.body.add(componentsField);
      },
    );

    final emitter = DartEmitter();
    String code = library.accept(emitter).toString();
    code = DartFormatter().format(code);

    buildStep.writeAsString(outputAsset, code);
  }
}
