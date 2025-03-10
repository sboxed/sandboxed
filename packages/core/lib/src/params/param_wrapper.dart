import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:developer';

class ParamWrapper<T> {
  final Map<String, dynamic> _meta = {};
  Map<String, dynamic> get meta => UnmodifiableMapView(_meta);

  final Completer<T?> _completer = Completer();
  Future<T?> get completed => _completer.future;

  T? _value;
  T? get value => null$ ? null : this._value;
  T? get rawValue => this._value;
  set value(T? value) => this._value = value;

  bool _null = true;
  bool get null$ => this._null;
  set null$(bool value) => this._null = !_required && value;

  bool _required = false;
  bool _resolved = false;

  bool get isRequired => _required;

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

    this._value = value;

    _completer.complete(value);

    return value;
  }

  T? optional(T? value) {
    if (_resolved) {
      return this.value;
    }

    if (_required && this._value == null) {
      log('param marked as required but value is null');
    }

    _resolved = true;
    _null = value == null;
    this._value = value;

    _completer.complete(value);

    return value;
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
