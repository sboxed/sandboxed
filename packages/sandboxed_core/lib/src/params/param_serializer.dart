import 'package:flutter/foundation.dart';

class ParamSerializer<T> {
  final dynamic Function(T? value) serialize;
  final T? Function(dynamic json) deserialize;

  const ParamSerializer({
    required this.serialize,
    required this.deserialize,
  });

  factory ParamSerializer.identity() {
    return ParamSerializer<T>(
      serialize: (value) => value,
      deserialize: (json) => json as T?,
    );
  }

  dynamic $serialize(dynamic value) {
    try {
      return serialize(value);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }

      return null;
    }
  }

  dynamic $deserialize(dynamic json) {
    if (json == null) return null as T?;

    try {
      return deserialize(json);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }

      return null as T?;
    }
  }
}
