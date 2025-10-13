import 'dart:convert';

import 'package:flutter/foundation.dart';

abstract interface class ParamSerializer<T> {
  dynamic $serialize(T value);

  T? $deserialize(dynamic json);

  /// Identity serializer
  ///
  /// Useful for primitive types
  ///
  /// Returns [null] if the value is not serializable
  factory ParamSerializer.primitive() {
    return DelegateParamSerializer<T>(
      serialize: (value) {
        try {
          return jsonEncode(value);
        } catch (e) {
          return null;
        }
      },
      deserialize: (json) => json as T?,
    );
  }
}

class DelegateParamSerializer<T> implements ParamSerializer<T> {
  final dynamic Function(T? value) serialize;
  final T? Function(dynamic json) deserialize;

  const DelegateParamSerializer({
    required this.serialize,
    required this.deserialize,
  });

  @override
  dynamic $serialize(T value) {
    try {
      return serialize(value);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }

      return null;
    }
  }

  @override
  T? $deserialize(dynamic json) {
    if (json == null) return null as T;

    try {
      return deserialize(json) as T;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }

      return null as T;
    }
  }
}
