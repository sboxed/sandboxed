import 'package:flutter/widgets.dart';
import 'package:vibook_core/params.dart';
import 'package:vibook_core/params/list_param.dart';

class ConstantParams implements Params {
  final Map<String, dynamic> defaultValues = {};

  ConstantParams();

  @override
  void update<T>(String id, T value) {}

  @override
  void updateDefaultValues(Map<String, dynamic> defaultValues) {
    defaultValues.clear();
    defaultValues.addAll(defaultValues);
  }

  dynamic param(String id, dynamic value) {
    final defaultValue = defaultValues[id];
    if (defaultValue == null) return value;

    if (value is double && defaultValue is int) {
      return defaultValue.toDouble();
    }

    return defaultValue;
  }

  // Core types

  @override
  bool boolean(String id, bool value) {
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
  bool? booleanMaybe(String id, bool? value) {
    return param(id, value);
  }

  @override
  double? numberMaybe(String id, double? value) {
    return param(id, value);
  }

  @override
  String? stringMaybe(String id, String? value) {
    return param(id, value);
  }

  // Framework-specific types

  @override
  Color color(String id, Color value) {
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
  Gradient gradient(String id, Gradient value) {
    return param(id, value);
  }

  @override
  Color? colorMaybe(String id, Color? value) {
    return param(id, value);
  }

  @override
  DateTime? datetimeMaybe(String id, DateTime? value) {
    return param(id, value);
  }

  @override
  Duration? durationMaybe(String id, Duration? value) {
    return param(id, value);
  }

  @override
  Gradient? gradientMaybe(String id, Gradient? value) {
    return param(id, value);
  }

  // Data types

  @override
  T single<T>(String id, T value, List<T> values, [ListParamType? type]) {
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
  T? singleMaybe<T>(
    String id,
    T? value,
    List<T> values, [
    ListParamType? type,
  ]) {
    return param(id, value);
  }

  @override
  List<T>? multiMaybe<T>(
    String id,
    List<T>? value,
    List<T> values, [
    ListParamType? type,
  ]) {
    return param(id, value);
  }

  // Generated

  @override
  T dynamic$<T>(String id, T value) {
    return param(id, value);
  }
}
