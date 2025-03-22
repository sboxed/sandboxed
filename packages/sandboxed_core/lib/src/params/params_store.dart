import 'package:flutter/widgets.dart';
import 'package:sandboxed_core/src/params/list_param.dart';
import 'package:sandboxed_core/src/params/param_wrapper.dart';

abstract interface class Params {
  void update<T>(String id, T value);
  void updateDefaultValues(Map<String, dynamic> defaultValues);
  void reset();

  // Core types
  ParamWrapper<bool> boolean(String id);
  ParamWrapper<String> string(String id);
  ParamWrapper<double> number(String id);
  ParamWrapper<int> integer(String id);

  // Framework-specific
  ParamWrapper<Color> color(String id);
  ParamWrapper<Gradient> gradient(String id);
  ParamWrapper<DateTime> datetime(String id);
  ParamWrapper<Duration> duration(String id);

  // Wrappers
  SingleChoiceParamWrapper<T> single<T>(String id, List<T> values);
  MultiChoiceParamWrapper<T> multi<T>(String id, List<T> values);

  // Generated
  ParamWrapper<T> dynamic$<T>(String id);
}
