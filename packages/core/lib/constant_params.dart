import 'package:flutter/widgets.dart';
import 'package:vibook_core/params.dart';
import 'package:vibook_core/params/list_param.dart';

class ConstantParams implements Params {
  final Map<String, dynamic> defaultValues;

  const ConstantParams({required this.defaultValues});

  @override
  void update<T>(String id, T value) {}

  dynamic param(String id, dynamic value) {
    final defaultValue = defaultValues[id];
    if (defaultValue == null) return value;

    if (value is double && defaultValue is int) {
      return defaultValue.toDouble();
    }

    return defaultValue;
  }

  @override
  bool boolean(String id, bool value) {
    return param(id, value);
  }

  @override
  Color color(String id, Color value) {
    return param(id, value);
  }

  @override
  double number(String id, double value) {
    return param(id, value);
  }

  @override
  String string(String id, String value) {
    return param(id, value);
  }

  @override
  List<T> multi<T>(
    String id,
    List<T> value,
    List<T> values, [
    ListParamType? type,
  ]) {
    return param(id, value);
  }

  @override
  T single<T>(String id, T value, List<T> values, [ListParamType? type]) {
    return param(id, value);
  }

  @override
  DateTime datetime(String id, DateTime value) {
    return param(id, value);
  }

  @override
  Duration duration(String id, Duration value) {
    return param(id, value);
  }

  @override
  T dynamic$<T>(String id, T value) {
    return param(id, value);
  }

  @override
  Gradient gradient(String id, Gradient value) {
    return param(id, value);
  }
}
