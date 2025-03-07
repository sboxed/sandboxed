import 'package:flutter/material.dart';
import 'package:vibook/addons/addon.dart';
import 'package:vibook/addons/decorator_addon.dart';
import 'package:vibook_core/decorator.dart';

final class BannerAddon extends Addon with DecoratorAddon {
  final String label;

  @override
  String get id => 'label';

  BannerAddon({required this.label}) : super();

  @override
  List<Decorator> decorate(BuildContext context) {
    return [
      Decorator(
        (context, story) {
          return Banner(
            message: label,
            location: BannerLocation.topEnd,
            child: story,
          );
        },
      ),
    ];
  }

  @override
  ValueNotifier<void> get notifier => ValueNotifier(null);
}
