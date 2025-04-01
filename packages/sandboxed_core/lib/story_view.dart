import 'package:flutter/material.dart';
import 'package:sandboxed_core/decorator.dart';
import 'package:sandboxed_core/meta.dart';
import 'package:sandboxed_core/src/params/params.dart';
import 'package:sandboxed_core/src/widgets/unsupported_param_widget.dart';
import 'package:sandboxed_core/story.dart';

class StoryView extends StatefulWidget {
  final Meta? meta;
  final Story story;
  final Params? params;
  final List<Decorator> decorators;

  const StoryView({
    super.key,
    this.meta,
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
    try {
      var child = widget.story.builder(context, params);
      child = widget.story.decorators.decorate(context, child);
      child = widget.meta?.decorators.decorate(context, child) ?? child;
      child = widget.decorators.decorate(context, child);

      return child;
    } on UnsupportedParamException catch (exception) {
      return UnsupportedParamWidget(exception: exception);
    }
  }
}
