import 'package:flutter/material.dart';

class DefaultResolver {
  final Map<Type, dynamic> _valuesByType;
  final Map<String, dynamic> _valuesByName;

  static void _voidCallback() {}

  const DefaultResolver({
    required Map<Type, dynamic> valuesByType,
    required Map<String, dynamic> valuesByName,
  })  : _valuesByType = valuesByType,
        _valuesByName = valuesByName;

  const DefaultResolver.basic()
      : _valuesByType = const {
          int: 0,
          num: 0.0,
          double: 0.0,
          bool: false,
          String: "",
          Duration: Duration.zero,
          Color: Colors.black,
          TextStyle: TextStyle(),
          Widget: SizedBox(),
          EdgeInsets: EdgeInsets.zero,
          EdgeInsetsGeometry: EdgeInsets.zero,
          EdgeInsetsDirectional: EdgeInsets.zero,
          Alignment: Alignment.center,
          AlignmentDirectional: Alignment.center,
          ShapeBorder: RoundedRectangleBorder(),
          Clip: Clip.none,
          FloatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          VoidCallback: _voidCallback,
        },
        _valuesByName = const {};

  dynamic resolve<T>() {
    return _valuesByType[T] ?? _valuesByName[T.toString()];
  }

  dynamic resolveByType(Type type) {
    return _valuesByType[type] ?? _valuesByName[type.toString()];
  }

  dynamic resolveByTypeName(String typeName) {
    return _valuesByName[typeName];
  }
}
