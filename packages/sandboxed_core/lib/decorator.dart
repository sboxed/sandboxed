import 'package:flutter/widgets.dart';

typedef DecoratorCallback = Widget Function(BuildContext context, Widget story);

/// {@template sandboxed.decorator}
/// Decorators are a mechanism to wrap a component in arbitrary markup when
/// rendering a story. Components are often created with assumptions about
/// ‘where’ they render. Your styles might expect a theme or layout wrapper,
/// or your UI might expect specific context or data providers.
///
/// A simple example is adding padding to a component’s stories. Accomplish
/// this using a decorator that wraps the stories in a padding widget,
/// like so:
/// ```dart
/// const meta = Meta(
///   component: Button,
///   decorators: [
///     (context, story) => Padding(
///       padding: EdgeInsets.all(8),
///       child: story,
///     ),
///   ],
/// );
/// ```
/// {@endtemplate}
class Decorator {
  final DecoratorCallback decorator;

  const Decorator(this.decorator);
}

abstract class DecoratorInterface implements Decorator {
  const DecoratorInterface();

  @override
  DecoratorCallback get decorator => decorate;

  Widget decorate(BuildContext context, Widget story);
}

extension DecoratorListX on Iterable<Decorator> {
  Widget decorate(BuildContext context, Widget child) {
    final decorators = toList().reversed;
    return decorators.fold(
      child,
      (child, element) => element.decorator(context, child),
    );
  }
}
