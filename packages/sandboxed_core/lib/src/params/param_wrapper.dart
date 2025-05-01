import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:developer';

import 'package:sandboxed_core/sandboxed_core.dart';

class ParamWrapper<T> {
  final Map<String, dynamic> _meta = {};
  Map<String, dynamic> get meta => UnmodifiableMapView(_meta);

  final Completer<T?> _completer = Completer();
  Future<T?> get completed => _completer.future;

  String? _id;
  Params? _params;

  String get id => _id ?? '<has no id>';

  T? _initialValue;
  T? _value;
  T? get value => null$ ? null : this._value;
  T? get rawValue => this._value;
  T? get initialValue => _initialValue;

  set value(T? value) => this._value = value;

  bool _null = true;
  bool get null$ => this._null;
  set null$(bool value) => this._null = !_required && value;

  bool _required = false;
  bool _resolved = false;

  bool get isRequired => _required;

  ParamWrapper<T> bind(String id, Params params) {
    _id = id;
    _params = params;
    return this;
  }

  T required(T value) {
    if (_resolved) {
      if (this._value == null) {
        throw StateError('param marked as required but value is null');
      }

      return this.value!;
    }

    _resolved = true;
    _required = true;
    _null = false;

    this._value ??= value;
    _initialValue = this._value;

    _completer.complete(this._value);

    return this._value!;
  }

  T? optional([T? value]) {
    if (_resolved) {
      return this.value;
    }

    if (_required && this._value == null) {
      log('param marked as required but value is null');
    }

    _resolved = true;
    _null = value == null;
    this._value ??= value;
    _initialValue = this._value;

    _completer.complete(this._value);

    return this._value;
  }

  T default$() {
    if (_resolved) {
      return this.value!;
    }

    final defaultValue = _params!.defaultFor<T>(this);

    _resolved = true;
    _null = defaultValue == null;
    this._value ??= defaultValue;
    _initialValue = this._value;

    _completer.complete(this._value);

    return this._value!;
  }

  ParamWrapper<T> apply(String key, dynamic value) {
    if (_isPlainDataType(value)) {
      _meta[key] = value;
    } else {
      log('_meta is restricted to simple dart types, received - ${value.runtimeType}');
    }

    return this;
  }
}

bool _isPlainDataType(dynamic value) {
  if (value is Map) return false;
  if (value is Iterable) return false;
  try {
    jsonEncode(value);
    return true;
  } catch (_) {
    return false;
  }
}

extension ParamWrapperX<T> on ParamWrapper<T> {
  ParamWrapper<T> describe(String description) {
    _meta['description'] = description;
    return this;
  }
}
