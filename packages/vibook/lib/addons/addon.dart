import 'package:flutter/foundation.dart';

abstract base class Addon extends ChangeNotifier {
  String get id;

  /// Serialize state to json encodable object
  dynamic serialize() => null;

  /// Read state from json-like object
  ///
  /// Possible values are:
  /// - Base DartType - bool, int, double, string, etc.
  /// - List<DartType> - list of objects of base dart type, list or map
  /// - Map<String, DartType> - map of objects of base dart type, list or map
  void deserialize(dynamic json) {}
}
