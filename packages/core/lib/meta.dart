import 'package:flutter/widgets.dart';
import 'package:recase/recase.dart';
import 'package:vibook_core/decorator.dart';

class Meta<T extends Widget> {
  final String? _name;
  final Type? _component;

  final String? module;

  final String? documentation;

  /// Parameters in JS-like format.
  final Map<String, dynamic> parameters;

  /// {@macro vibook.decorator}
  final List<Decorator> decorators;

  const Meta({
    String? name,
    Type? component,
    this.module,
    this.documentation,
    this.parameters = const {},
    this.decorators = const [],
  })  : _name = name,
        _component = component;

  String get name => _name ?? '$T'.titleCase;

  String get displayName =>
      name.split('/').last.trim().replaceAll(RegExp(r'^[\d.]+'), '').trim();

  Type get component => _component ?? T;

  Meta<T> copyWith({
    String? name,
    String? documentation,
    String? module,
  }) {
    return Meta(
      name: name ?? this.name,
      documentation: documentation ?? this.documentation,
      module: module ?? this.module,

      // shared
      component: component,
      parameters: parameters,
      decorators: decorators,
    );
  }
}
