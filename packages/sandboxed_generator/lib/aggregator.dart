import 'dart:async';
import 'dart:convert';

import 'package:analyzer/dart/element/element2.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:collection/collection.dart';
import 'package:dart_style/dart_style.dart';
import 'package:sandboxed_generator/config/aggregator_config.dart';
import 'package:sandboxed_generator/docs_cleaner.dart';
import 'package:sandboxed_generator/parsers/library_parser.dart';
import 'package:sandboxed_generator/types/type_checker.dart';
import 'package:yaml/yaml.dart';

class StoryContainer {
  final String path;
  final String package;
  final LibraryElement2 library;
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
  final Reference? config;
  final List<StoryContainer> storyContainers;

  const PackageStories({
    required this.package,
    required this.storyContainers,
    required this.config,
  });
}

class ComponentAggregateBuilder extends Builder {
  final AggregatorConfig config;
  late final String output = config.outputPath;

  ComponentAggregateBuilder(this.config);

  @override
  Map<String, List<String>> get buildExtensions => {
        r'$lib$': [output],
      };

  Future<String?> findDocs(BuildStep buildStep, AssetId target) async {
    final docAsset = AssetId(
      target.package,
      target.path.replaceAll('.stories.dart', '.mdx'),
    );

    if (await buildStep.canRead(docAsset)) {
      var content = await buildStep.readAsString(docAsset);
      content = DocsCleaner().clean(content);
      return content; //
    }

    return null;
  }

  Future<Reference?> readConfig(BuildStep buildStep, String package) async {
    try {
      final configAsset = AssetId(package, 'lib/stories/config.dart');
      if (await buildStep.canRead(configAsset)) {
        final library = await buildStep.resolver.libraryFor(configAsset);
        final configType = TypeChecker.fromName(
          'Config',
          packageName: 'sandboxed_core',
        );

        for (final element in library.getters) {
          if (element case PropertyAccessorElement2 accessor
              when configType.isAssignableFrom(accessor.returnType.element3!)) {
            final name = accessor.name3;
            if (name == null) {
              throw ArgumentError.notNull('accessor.name3');
            }

            return refer(name, library.uri.toString());
          }
        }
      }
    } catch (e, s) {
      log.severe('Failed to read package configuration', e, s);
    }

    return null;
  }

  bool checkDependency(String package, YamlMap pubspec) {
    final dependencies = pubspec['dependencies'] as YamlMap?;
    if (dependencies == null) return false;

    return dependencies.containsKey(package);
  }

  @override
  Future<void> build(BuildStep buildStep) async {
    final outputAsset = AssetId(buildStep.inputId.package, 'lib/$output');
    final List<PackageStories> packageStories = [];
    final packageConfig = await buildStep.packageConfig;
    final pubspec = loadYaml(await buildStep.readAsString(
      AssetId(buildStep.inputId.package, 'pubspec.yaml'),
    ));

    for (final package in packageConfig.packages) {
      final asset = AssetId(package.name, 'lib/stories.json');

      if (await buildStep.canRead(asset) == false) continue;
      if (package.name != buildStep.inputId.package &&
          !checkDependency(package.name, pubspec)) {
        continue;
      }

      final config = await readConfig(buildStep, package.name);

      final jsonContent = await buildStep.readAsString(asset);
      final storyContainerPaths = (jsonDecode(jsonContent) as List) //
          .cast<String>();

      final storyContainers = <StoryContainer>[];

      for (final path in storyContainerPaths) {
        final asset = AssetId(package.name, path);
        final library = await buildStep.resolver.libraryFor(asset);
        final docs = await findDocs(buildStep, asset);

        storyContainers.add(
          StoryContainer(
            path: path,
            package: package.name,
            library: library,
            docs: [if (docs case String docs) docs],
          ),
        );
      }

      if (storyContainers.isNotEmpty) {
        packageStories.add(
          PackageStories(
            config: config,
            package: package.name,
            storyContainers: storyContainers,
          ),
        );
      }
    }

    List<(String, Spec)> components = [];
    for (final package in packageStories) {
      for (final storyContainer in package.storyContainers) {
        final parser = LibraryParser(
          resolver: buildStep.resolver,
          config: config,
          isRootPackage: buildStep.inputId.package == package.package,
          package: package.package,
          configReference: package.config,
          path: storyContainer.path,
          library: storyContainer.library,
          docs: storyContainer.docs,
        );

        final result = await parser.build();
        components.add(result);
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

        library.directives.addAll([
          Directive.import('package:sandboxed_core/sandboxed_core.dart'),
          Directive.import('package:flutter/material.dart'),
        ]);

        print(components //
            .sortedBy((it) => it.$1)
            .map((it) => it.$1)
            .toList());

        library.body.add(
          Method(
            (method) {
              method
                ..name = 'components'
                ..lambda = true //
                ..type = MethodType.getter
                ..returns = refer('List<Component>')
                ..body = literalList(
                        components //
                            .sortedBy((it) => it.$1)
                            .map((it) => it.$2)
                            .toList(),
                        refer('Component'))
                    .code;
            },
          ),
        );
      },
    );

    final allocator = Allocator.simplePrefixing();
    final emitter = DartEmitter(
      allocator: allocator,
      useNullSafetySyntax: true,
    );

    String code = library.accept(emitter).toString();
    try {
      code = DartFormatter(languageVersion: DartFormatter.latestLanguageVersion)
          .format(code);
    } catch (e) {
      print(e);
    }

    buildStep.writeAsString(outputAsset, code);
  }
}
