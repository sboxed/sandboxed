import 'package:flutter/material.dart';
import 'package:sandboxed_core/sandboxed_core.dart';

typedef _WidgetChildBuilder = Widget Function(
  BuildContext context,
  Widget child,
);

/// {@template sandboxed.story_view}
/// A widget that displays a story with a set of parameters.
///
/// This widget is used as the main entry point for rendering a story.
///
/// The story is displayed with the given [params] and [decorators].
///
/// If no [params] are provided, the story's default values are used.
///
/// If no [decorators] are provided, the story's default decorators are used.
/// {@endtemplate}
class StoryView extends StatefulWidget {
  /// The meta information about the component.
  final Meta? meta;

  /// The story to be displayed.
  final Story story;

  /// The optional parameters for the story.
  final ParamStorage? params;

  /// The optional decorators for the story.
  final List<Decorator> decorators;

  /// Creates a new [StoryView] widget.
  ///
  /// {@macro sandboxed.story_view}
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
  late final params = widget.params ?? ParamStorage();

  @override
  void initState() {
    params.setInitialValues(widget.story.params);

    super.initState();
  }

  Widget wrapWithErrorCatcher(BuildContext context, WidgetBuilder builder) {
    try {
      return builder(context);
    } on UnsupportedParamException catch (exception) {
      return UnsupportedParamWidget(exception: exception);
    } on UnsupportedGenericParametersException catch (exception) {
      return SandboxedUnsupportedGenericParametersErrorWidget(
          exception: exception);
    } on AbstractWidgetClassException {
      return const SandboxedAbstractWidgetErrorWidget();
    }
  }

  Widget buildStory() {
    try {
      return widget.story.builder(context, params);
    } on UnsupportedParamException catch (exception) {
      return UnsupportedParamWidget(exception: exception);
    } on UnsupportedGenericParametersException catch (exception) {
      return SandboxedUnsupportedGenericParametersErrorWidget(
          exception: exception);
    } on AbstractWidgetClassException {
      return const SandboxedAbstractWidgetErrorWidget();
    }
  }

  @override
  Widget build(BuildContext context) {
    var queue = <_WidgetChildBuilder>[
      (c, ch) => widget.story.builder(c, params),
      (c, ch) => widget.story.decorators.decorate(c, ch),
      (c, ch) => widget.meta?.decorators.decorate(c, ch) ?? ch,
      (c, ch) => widget.decorators.decorate(c, ch),
    ];

    Widget child = const SizedBox();
    for (final builder in queue) {
      child = wrapWithErrorCatcher(
        context,
        (context) => builder(context, child),
      );
    }

    return child;
  }
}
