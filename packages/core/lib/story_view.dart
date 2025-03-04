import 'package:flutter/widgets.dart';
import 'package:vibook_core/decorator.dart';
import 'package:vibook_core/meta.dart';
import 'package:vibook_core/params.dart';
import 'package:vibook_core/params/list_param.dart';
import 'package:vibook_core/story.dart';

class StoryView extends StatelessWidget {
  final Meta meta;
  final Story story;
  final Params? params;
  final List<Decorator> decorators;

  const StoryView({
    super.key,
    required this.meta,
    required this.story,
    this.decorators = const [],
    this.params,
  });

  @override
  Widget build(BuildContext context) {
    final params = this.params ?? ParamsTmp();

    var child = story.builder(context, params);
    child = story.decorators.decorate(context, child);
    child = meta.decorators.decorate(context, child);
    child = decorators.decorate(context, child);

    return child;
  }
}

class ParamsTmp implements Params {
  @override
  void update<T>(String id, T value) {}

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

  @override
  List<T> multi<T>(
    String id,
    List<T> value,
    List<T> values, [
    ListParamType? type,
  ]) {
    return value;
  }

  @override
  T single<T>(String id, T value, List<T> values, [ListParamType? type]) {
    return value;
  }
}
