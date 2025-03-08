import 'package:flutter/widgets.dart';
import 'package:vibook_core/params/list_param.dart';

abstract interface class Params {
  void update<T>(String id, T value);
  void updateDefaultValues(Map<String, dynamic> defaultValues);

  // Core types
  String string(String id, String value);
  bool boolean(String id, bool value);
  double number(String id, double value);

  String? stringMaybe(String id, String? value);
  bool? booleanMaybe(String id, bool? value);
  double? numberMaybe(String id, double? value);

  // Framework-specific
  Color color(String id, Color value);
  Gradient gradient(String id, Gradient value);
  DateTime datetime(String id, DateTime value);
  Duration duration(String id, Duration value);

  Color? colorMaybe(String id, Color? value);
  Gradient? gradientMaybe(String id, Gradient? value);
  DateTime? datetimeMaybe(String id, DateTime? value);
  Duration? durationMaybe(String id, Duration? value);

  // Wrappers
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

  T? singleMaybe<T>(
    String id,
    T? value,
    List<T> values, [
    ListParamType? type,
  ]);

  List<T>? multiMaybe<T>(
    String id,
    List<T>? value,
    List<T> values, [
    ListParamType? type,
  ]);

  // Generated
  T dynamic$<T>(String id, T value);
}

// TODO(@melvspace): 03/03/25 research extenting
extension on Params {
  double numberSlider(String id, double value) {
    return value;
  }
}
