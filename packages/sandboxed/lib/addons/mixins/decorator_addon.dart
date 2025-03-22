import 'package:flutter/widgets.dart';
import 'package:sandboxed/addons/addon.dart';
import 'package:sandboxed_core/decorator.dart';

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
