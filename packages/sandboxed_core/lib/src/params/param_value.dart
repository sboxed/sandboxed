import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sandboxed_core/src/params/param_builder.dart';
import 'package:sandboxed_core/src/params/delegate_param_serializer.dart';

abstract mixin class ValueEditorPresenter<T> {
  const ValueEditorPresenter();

  Widget build(BuildContext context, ParamValue<T> value);

  ValueEditorPresenter<TOther> cast<TOther extends T>() {
    return this as ValueEditorPresenter<TOther>;
  }
}

class DelegateValueEditorPresenter<T> extends ValueEditorPresenter<T> {
  final Widget Function(BuildContext context, ParamValue<T> value) builder;

  DelegateValueEditorPresenter(this.builder);

  @override
  Widget build(BuildContext context, ParamValue<T> value) {
    return builder(context, value);
  }
}

class ParamValue<T> extends ChangeNotifier {
  final ValueEditorPresenter<T>? editor;
  final ParamSerializer<T>? serializer;
  final List<ParamContraint<T>> constraints;
  final Map<String, Object> _metadata;

  final bool required;
  final T? initial;
  final T? default$;

  T? _value;
  T? get value => _value;

  bool get changed {
    if (_value is List) {
      return !listEquals(_value as List?, initial as List?);
    }

    if (_value is Map) {
      return !mapEquals(_value as Map?, initial as Map?);
    }

    return _value != initial;
  }

  Map<String, Object> get metadata => UnmodifiableMapView(_metadata);

  ParamValue({
    T? value,
    this.required = false,
    this.default$,
    this.editor,
    this.serializer,
    Map<String, Object> metadata = const {},
    required this.constraints,
  })  : _value = value,
        _metadata = metadata,
        initial = value;

  void update(T? value) {
    if (required && value == null) {
      throw ArgumentError.notNull('value');
    }

    // TODO(@melvspace): 10/10/25 should we constrain null values? there are optional/required for that but need to think about it
    if (value != null) {
      if (constraints.any((validate) => !validate(value))) {
        throw ArgumentError.value(
          value,
          'value is not valid because of constraints',
        );
      }
    }

    _value = value;
    notifyListeners();
  }

  void reset() {
    _value = initial;
    notifyListeners();
  }
}
