import 'package:flutter/widgets.dart';
import 'package:recase/recase.dart';
import 'package:vibook_core/decorator.dart';

class Meta<T extends Widget> {
  final String? _name;
  final Type? _component;

  final String? module;

  /// Parameters in JS-like format.
  final Map<String, dynamic> parameters;

  /// {@macro vibook.decorator}
  final List<Decorator> decorators;

  const Meta({
    String? name,
    Type? component,
    this.module,
    this.parameters = const {},
    this.decorators = const [],
  })  : _name = name,
        _component = component;

  String get name => _name ?? '$T'.titleCase;

  String get displayName =>
      name.split('/').last.trim().replaceAll(RegExp(r'^[\d.]+'), '').trim();

  Type get component => _component ?? T;
}
