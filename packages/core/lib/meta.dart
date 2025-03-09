import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:recase/recase.dart';
import 'package:vibook_core/decorator.dart';
import 'package:vibook_core/document_entry.dart';

class Meta<T extends Widget> {
  final String? _name;
  final Type? _component;

  final String? module;

  final List<DocumentEntry> documentation;

  /// Parameters in JS-like format.
  final Map<String, dynamic> parameters;

  /// {@macro vibook.decorator}
  final List<Decorator> decorators;

  const Meta({
    String? name,
    Type? component,
    this.module,
    this.documentation = const [],
    this.parameters = const {},
    this.decorators = const [],
  })  : _name = name,
        _component = component;

  Type get component => _component ?? T;

  String get name {
    if (_name == null) {
      log('$T: You have not defined name for component. On Web platform it will be unobtainable due to flutter optimizations');
    }

    if (kIsWeb && _name == null) {
      return '<Unobtainable name #${component.hashCode}>';
    }

    return _name ?? '$component'.titleCase;
  }

  String get displayName {
    return name
        .split('/')
        .last
        .trim()
        .replaceAll(RegExp(r'^[\d.]+'), '')
        .trim();
  }

  Meta<T> copyWith({
    String? name,
    List<DocumentEntry>? documentation,
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

  List<String> get warnings => [
        if (_name == null)
          'Name of component is not set, in minified builds it will be unobtainable',
      ];
}
