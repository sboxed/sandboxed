import 'package:flutter/widgets.dart';
import 'package:sandboxed/addons/addon.dart';
import 'package:sandboxed_core/decorator.dart';

/// This addon provide extra decorators to Story viewport.
///
/// This can be used to change the way the story is displayed.
///
/// This addon have its own state and updates decorators when it changes.
base mixin DecoratorAddon<T> on Addon {
  T get initialValue;

  late T _value = initialValue;
  T get value => _value;
  set value(T value) {
    bool changed = _value != value;
    _value = value;

    if (changed) {
      notifyListeners();
    }
  }

  Widget? buildEditor(BuildContext context) {
    return null;
  }

  List<Decorator> decorate(BuildContext context) => [];
}
