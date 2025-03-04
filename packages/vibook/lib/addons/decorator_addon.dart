import 'package:flutter/widgets.dart';
import 'package:vibook/addons/addon.dart';
import 'package:vibook_core/decorator.dart';

base mixin DecoratorAddon<T> on Addon {
  ValueNotifier<T> get notifier;

  Widget? buildEditor(BuildContext context) {
    return null;
  }

  List<Decorator> decorate(BuildContext context) => [];
}
