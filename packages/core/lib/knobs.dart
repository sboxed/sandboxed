import 'package:flutter/widgets.dart';

abstract interface class Knobs {
  String string(String id, String value);
  bool boolean(String id, bool value);
  double number(String id, double value);

  Color color(String id, Color value);
}

// TODO(@melvspace): 03/03/25 research extenting
extension on Knobs {
  double numberSlider(String id, double value) {
    return value;
  }
}
