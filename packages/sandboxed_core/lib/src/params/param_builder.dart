import 'package:flutter/foundation.dart';
import 'package:sandboxed_core/src/params/param_editor.dart';
import 'package:sandboxed_core/src/params/delegate_param_serializer.dart';
import 'param_value.dart';
import 'param_storage.dart';

typedef ParamContraint<T> = bool Function(T newValue);

class ParamBuilder<T> {
  final String id;

  ParamStorage? _store;
  ParamEditor<T>? _editor;
  List<ParamContraint<T>> _constraints = [];
  T? _defaultValue;

  ParamSerializer<T>? _serializer;

  ParamBuilder(this.id);

  ParamEditor<T>? readEditor() => _editor;

  ParamBuilder<T> constrain(
    ParamContraint<T> constraint, {
    bool replace = false,
  }) {
    if (replace) {
      _constraints = [constraint];
    } else {
      _constraints.add(constraint);
    }

    return this;
  }

  ParamBuilder<T> serializable(ParamSerializer<T> serializer) {
    _serializer = serializer;
    return this;
  }

  ParamBuilder<T> store(ParamStorage store) {
    if (_store != null) throw Exception('ParamBuilder already has a store');

    _store = store;
    return this;
  }

  ParamBuilder<T> editor<TEditor extends ParamEditor<T>>(TEditor editor) {
    _editor = editor;
    return this;
  }

  ParamBuilder<T> withDefault(T value) {
    _defaultValue = value;
    return this;
  }

  ParamValue<T> build(T? value, bool required) {
    final store = _store;
    if (store == null) throw Exception('ParamBuilder has no store');

    final initial = _mapEdgeCases(store.getInitialValue(id), value);
    final default$ = _defaultValue ?? store.defaultResolver.resolve<T>();

    return ParamValue<T>(
      value: initial ?? value,
      default$: default$,
      required: required,
      serializer: _serializer,
      editor: _editor is ValueEditorPresenter<T> //
          ? _editor as ValueEditorPresenter<T>
          : store.resolve(_editor),
      constraints: _constraints,
    );
  }

  T? optional([T? value]) {
    final store = _store;
    if (store == null) throw Exception('ParamBuilder has no store');

    if (store.get(id) case ParamValue value) {
      if (value.required) {
        if (kDebugMode) {
          print(
            "WARNING: param is registered as required but requested as optional",
          );
        }
      }

      return value.value;
    } else {
      final valueContainer = build(value, false);
      store.register(id, valueContainer);
      return valueContainer.value;
    }
  }

  T required(T value) {
    final store = _store;
    if (store == null) throw Exception('ParamBuilder has no store');

    if (store.get(id) case ParamValue value) {
      if (!value.required) throw Exception('param is not required');
      return value.value!;
    } else {
      final valueContainer = build(value, true);
      store.register(id, valueContainer);
      return valueContainer.value!;
    }
  }

  T default$({Type? type, String? typeName}) {
    final store = _store;
    if (store == null) throw Exception('ParamBuilder has no store');

    T? value;
    if (_defaultValue != null) {
      value = _defaultValue as T;
    } else if (type != null) {
      value = store.defaultResolver.resolveByType(type);
    } else if (typeName != null) {
      value = store.defaultResolver.resolveByTypeName(typeName);
    } else {
      value = store.defaultResolver.resolve<T>();
    }

    value ??= _mapEdgeCases(store.getInitialValue(id), null);

    if (value == null) {
      return optional(null as T) as T;
    }

    return required(value);
  }

  /// In some scenarios we can pass values that can be interchanged with expected type.
  ///
  /// For example, int can be passed as double
  T? _mapEdgeCases(dynamic value, T? hint) {
    // Restoring iterable types
    switch (hint) {
      case List hint when value is Iterable:
        final copy = hint.toList()..clear();
        for (final value in value) {
          copy.add(value);
        }

        return copy as T;

      case Set hint when value is Iterable:
        final copy = hint.toSet()..clear();
        for (final value in value) {
          copy.add(value);
        }

        return copy as T;

      case Map hint when value is Map:
        final copy = {...hint}..clear();
        for (final entry in value.entries) {
          copy[entry.key] = entry.value;
        }

        return copy as T;
    }

    // Restoring basic types
    switch (T) {
      case const (double) when value is int:
        return value.toDouble() as T;

      default:
        return value as T?;
    }
  }
}
