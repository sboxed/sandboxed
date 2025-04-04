import 'package:flutter/material.dart';
import 'package:sandboxed/addons/addon.dart';
import 'package:sandboxed/addons/mixins/decorator_addon.dart';
import 'package:sandboxed_core/decorator.dart';

final class BannerAddon extends Addon with DecoratorAddon {
  final String label;
  final Color color;
  final TextStyle style;
  final BannerLocation location;

  @override
  get initialValue => null;

  @override
  String get id => 'label';

  BannerAddon({
    required this.label,
    this.location = BannerLocation.topEnd,
    this.color = const Color(0xA0B71C1C),
    this.style = const TextStyle(
      color: Color(0xFFFFFFFF),
      fontSize: 12 * 0.85,
      fontWeight: FontWeight.w900,
      height: 1.0,
    ),
  }) : super();

  @override
  List<Decorator> decorate(BuildContext context) {
    return [
      Decorator(
        (context, story) {
          return Banner(
            message: label,
            color: color,
            location: location,
            textStyle: style,
            child: story,
          );
        },
      ),
    ];
  }
}
