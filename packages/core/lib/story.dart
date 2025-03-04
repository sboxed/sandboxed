import 'package:flutter/widgets.dart';
import 'package:vibook_core/decorator.dart';
import 'package:vibook_core/knobs.dart';

typedef StoryBuilder = Widget Function(BuildContext context, Knobs knobs);

class Story {
  final String? name;

  final StoryBuilder builder;

  /// {@macro vibook.decorator}
  final List<Decorator> decorators;

  const Story({
    this.name,
    this.decorators = const [],
    required this.builder,
  });

  /// To override name by generator.
  Story withName(String name) {
    return Story(
      name: name,
      decorators: decorators,
      builder: builder,
    );
  }
}
