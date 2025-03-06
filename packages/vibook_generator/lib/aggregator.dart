import 'dart:async';
import 'dart:convert';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:glob/glob.dart';
import 'package:vibook_generator/docs_cleaner.dart';
import 'package:vibook_generator/library_parser.dart';

class StoryContainer {
  final String path;
  final LibraryElement library;

  StoryContainer({required this.path, required this.library});

  String get id => path.split('/').last.split('.').first;
}

class PackageStories {
  final String package;
  final List<StoryContainer> storyContainers;
  final String? docs;

  const PackageStories({
    required this.package,
    required this.storyContainers,
    this.docs,
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

    if (await buildStep.canRead(docAsset)) {
      var content = await buildStep.readAsString(docAsset);
      content = DocsCleaner().clean(content);
      return content;
    }

    return null;
  }

  @override
  Future<void> build(BuildStep buildStep) async {
    final outputAsset = AssetId(buildStep.inputId.package, 'lib/$output');
    final List<PackageStories> packageStories = [];
    final localStoryContainers = await buildStep
        .findAssets(Glob('**/*.stories.dart')) //
        .toList();

    for (final asset in localStoryContainers) {
      final storyContainers = <StoryContainer>[];

      final library = await buildStep.resolver.libraryFor(asset);
      final docs = await findDocs(buildStep, asset);

      storyContainers.add(
        StoryContainer(
          path: asset.path,
          library: library,
        ),
      );

      if (storyContainers.isNotEmpty) {
        packageStories.add(
          PackageStories(
            package: buildStep.inputId.package,
            storyContainers: storyContainers,
            docs: docs,
          ),
        );
      }
    }

    for (final package in (await buildStep.packageConfig).packages) {
      final asset = AssetId(package.name, 'lib/stories.json');
      if (await buildStep.canRead(asset) == false) continue;

      final jsonContent = await buildStep.readAsString(asset);
      final storyContainerPaths = (jsonDecode(jsonContent) as List) //
          .cast<String>();

      final storyContainers = <StoryContainer>[];
      final docs = await findDocs(buildStep, asset);

      for (final path in storyContainerPaths) {
        final asset = AssetId(package.name, path);
        final library = await buildStep.resolver.libraryFor(asset);

        storyContainers.add(
          StoryContainer(
            path: path,
            library: library,
          ),
        );
      }

      if (storyContainers.isNotEmpty) {
        packageStories.add(
          PackageStories(
            package: package.name,
            storyContainers: storyContainers,
            docs: docs,
          ),
        );
      }
    }

    final library = Library(
      (library) {
        library.directives
            .add(Directive.import('package:vibook_core/vibook_core.dart'));

        List<Directive> directives = [];
        List<Code> components = [];

        for (final package in packageStories) {
          for (final storyContainer in package.storyContainers) {
            final parser = LibraryParser(
              package: package.package,
              path: storyContainer.path,
              library: storyContainer.library,
              docs: package.docs,
            );

            directives.add(parser.import);
            components.add(parser.build());
          }
        }

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
