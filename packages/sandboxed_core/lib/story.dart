import 'package:sandboxed_core/sandboxed_core.dart';

class Story {
  final String? name;

  final StoryBuilder builder;

  /// {@macro sandboxed.decorator}
  final List<Decorator> decorators;

  /// Pre-defined params.
  final Map<String, dynamic> params;

  final List<String> tags;

  final int order;

  const Story({
    this.name,
    this.decorators = const [],
    this.order = 0,
    this.builder = AutomaticBuilder,
    this.params = const {},
    this.tags = const [],
  });

  const Story.apply({
    required this.name,
    required this.decorators,
    required this.order,
    required this.builder,
    required this.params,
    required this.tags,
  });

  Story applyGenerated({
    String? name,
    StoryBuilder? builder,
  }) {
    builder = this.builder == AutomaticBuilder
        ? (builder ?? this.builder)
        : this.builder;

    return Story.apply(
      name: this.name ?? name,
      builder: builder,
      decorators: decorators,
      order: order,
      params: params,
      tags: tags,
    );
  }
}
