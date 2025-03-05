import 'dart:async';
import 'dart:convert';

import 'package:build/build.dart';
import 'package:glob/glob.dart';

class GathererBuilder extends Builder {
  final String output = 'stories.json';

  @override
  Future<void> build(BuildStep buildStep) async {
    final stories = await buildStep //
        .findAssets(Glob('**/*.stories.dart'))
        .toList();

    if (stories.isEmpty) {
      return;
    }

    final json = jsonEncode(stories.map((e) => e.path).toList());

    final outputAsset = AssetId(buildStep.inputId.package, 'lib/$output');
    buildStep.writeAsString(outputAsset, json);
  }

  @override
  Map<String, List<String>> get buildExtensions => {
        r'$lib$': [output],
      };
}
