import 'package:flutter/widgets.dart';
import 'package:vibook_core/decorator.dart';
import 'package:vibook_core/knobs.dart';
import 'package:vibook_core/meta.dart';
import 'package:vibook_core/story.dart';

class StoryView extends StatelessWidget {
  final Meta meta;
  final Story story;
  final List<Decorator> decorators;

  const StoryView({
    super.key,
    required this.meta,
    required this.story,
    this.decorators = const [],
  });

  @override
  Widget build(BuildContext context) {
    final knobs = KnobsTmp();

    var child = story.builder(context, knobs);
    child = story.decorators.decorate(context, child);
    child = meta.decorators.decorate(context, child);
    child = decorators.decorate(context, child);

    return child;
  }
}

class KnobsTmp implements Knobs {
  @override
  bool boolean(String id, bool value) {
    return value;
  }

  @override
  Color color(String id, Color value) {
    return value;
  }

  @override
  double number(String id, double value) {
    return value;
  }

  @override
  String string(String id, String value) {
    return value;
  }
}
