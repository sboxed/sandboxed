import 'package:flutter/widgets.dart';
import 'package:vibook_core/params/list_param.dart';

abstract interface class Params {
  void update<T>(String id, T value);
  String string(String id, String value);
  bool boolean(String id, bool value);
  double number(String id, double value);
  Color color(String id, Color value);

  T single<T>(
    String id,
    T value,
    List<T> values, [
    ListParamType? type,
  ]);

  List<T> multi<T>(
    String id,
    List<T> value,
    List<T> values, [
    ListParamType? type,
  ]);
}

// TODO(@melvspace): 03/03/25 research extenting
extension on Params {
  double numberSlider(String id, double value) {
    return value;
  }
}
