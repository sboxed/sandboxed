import 'package:flutter/foundation.dart';
import 'package:sandboxed/utility/map_difference.dart';

abstract base class Addon extends ChangeNotifier {
  String get id;
  dynamic _initialState;
  dynamic get initialSerializedState => _initialState;

  Addon() {
    _initialState = encode();
  }

  /// Serialize state to json encodable object
  dynamic encode() => null;

  /// Read state from json-like object
  ///
  /// Possible values are:
  /// - Base DartType - bool, int, double, string, etc.
  /// - List<DartType> - list of objects of base dart type, list or map
  /// - Map<String, DartType> - map of objects of base dart type, list or map
  void decode(dynamic state) {}

  /// Encode state and return difference from initial state.
  dynamic encodeWithDifference() {
    final state = encode();
    switch (state) {
      case Map<String, dynamic> map:
        final initialState = initialSerializedState as Map<String, dynamic>;
        final difference = initialState.difference(map);
        if (difference.isEmpty) return null;

        return difference;

      case Object value when initialSerializedState != value:
        return value;

      default:
        return null;
    }
  }
}
