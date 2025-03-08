import 'package:flutter/widgets.dart';
import 'package:vibook_core/constant_params.dart';
import 'package:vibook_core/decorator.dart';
import 'package:vibook_core/meta.dart';
import 'package:vibook_core/params.dart';
import 'package:vibook_core/story.dart';

class StoryView extends StatefulWidget {
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
  State<StoryView> createState() => _StoryViewState();
}

class _StoryViewState extends State<StoryView> {
  late final params = widget.params ?? ConstantParams();

  @override
  void initState() {
    params.updateDefaultValues(widget.story.params);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var child = widget.story.builder(context, params);
    child = widget.story.decorators.decorate(context, child);
    child = widget.meta.decorators.decorate(context, child);
    child = widget.decorators.decorate(context, child);

    return child;
  }
}
