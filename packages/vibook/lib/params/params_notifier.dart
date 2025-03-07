import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'package:vibook_core/param.dart';
import 'package:vibook_core/params.dart';
import 'package:vibook_core/params/list_param.dart';

class ParamsNotifier extends ChangeNotifier implements Params {
  final Map<String, Param> _params = {};

  Map<String, Param> get items => UnmodifiableMapView(_params);

  Param<T> param<T>(String id, T value) {
    return _params.putIfAbsent(id, () => Param<T>(value)) as Param<T>;
  }

  @override
  void update<T>(String id, T value) {
    items[id]?.value = value;

    // TODO(@melvspace): 03/07/25 detect widget tree is building.
    Future.microtask(notifyListeners);
  }

  @override
  bool boolean(String id, bool value) {
    return param(id, value).value;
  }

  @override
  Color color(String id, Color value) {
    return param(id, value).value;
  }

  @override
  double number(String id, double value) {
    return param(id, value).value;
  }

  @override
  String string(String id, String value) {
    return param(id, value).value;
  }

  Map<String, dynamic> serialize() {
    return _params.map(
      (key, value) => MapEntry(key, value.value),
    );
  }

  /// Updates state of notifier.
  ///
  /// Should be called after story loaded it's params.
  void deserialize(Map<String, dynamic> json) {
    for (final entry in json.entries) {
      update(entry.key, entry.value);
    }
  }

  @override
  T single<T>(String id, T value, List<T> values, [ListParamType? type]) {
    return _params
        .putIfAbsent(id, () => SingleParam(value, values, type))
        .value;
  }

  @override
  List<T> multi<T>(
    String id,
    List<T> value,
    List<T> values, [
    ListParamType? type,
  ]) {
    return _params
        .putIfAbsent(
          id,
          () => MultiParam(
            value,
            values,
            type,
          ),
        )
        .value;
  }

  @override
  DateTime datetime(String id, DateTime value) {
    return param(id, value).value;
  }

  @override
  Duration duration(String id, Duration value) {
    return param(id, value).value;
  }

  @override
  T dynamic$<T>(String id, T value) {
    return param(id, value).value;
  }

  @override
  Gradient gradient(String id, Gradient value) {
    return param(id, value).value;
  }
}
