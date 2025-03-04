import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'package:vibook_core/knobs.dart';

class KnobsNotifier extends ChangeNotifier implements Knobs {
  final Map<String, Knob> _knobs = {};

  Map<String, Knob> get items => UnmodifiableMapView(_knobs);

  Knob<T> knob<T>(String id, T value) {
    return _knobs.putIfAbsent(id, () => Knob<T>(value)).value;
  }

  @override
  bool boolean(String id, bool value) {
    return knob(id, value).value;
  }

  @override
  Color color(String id, Color value) {
    return knob(id, value).value;
  }

  @override
  double number(String id, double value) {
    return knob(id, value).value;
  }

  @override
  String string(String id, String value) {
    return knob(id, value).value;
  }
}

class Knob<T> {
  final T value;

  Knob(this.value);
}
