import 'package:flutter/widgets.dart';
import 'package:sandboxed_core/src/params/list_param.dart';
import 'package:sandboxed_core/src/params/param_wrapper.dart';
import 'package:sandboxed_core/src/params/params_store.dart';
import 'package:sandboxed_core/src/params/use_params.dart';

class ConstantParams implements Params {
  final Map<String, dynamic> defaultValues = {};

  ConstantParams();

  @override
  void update<T>(String id, T value) {}

  @override
  void updateDefaultValues(Map<String, dynamic> defaultValues) {
    this.defaultValues.clear();
    this.defaultValues.addAll(defaultValues);
  }

  @override
  void reset() {}

  ParamWrapper<T> param<T>(String id) {
    return ParamWrapper() //
      ..value = switch (defaultValues[id]) {
        UseParams useParams => useParams.builder(this),
        dynamic value => value,
      };
  }

  // Core types

  @override
  ParamWrapper<bool> boolean(String id) {
    return param(id);
  }

  @override
  ParamWrapper<String> string(String id) {
    return param(id);
  }

  @override
  ParamWrapper<double> number(String id) {
    return param(id);
  }

  @override
  ParamWrapper<int> integer(String id) {
    return param(id);
  }

  // Framework-specific types

  @override
  ParamWrapper<Color> color(String id) {
    return param(id);
  }

  @override
  ParamWrapper<DateTime> datetime(String id) {
    return param(id);
  }

  @override
  ParamWrapper<Duration> duration(String id) {
    return param(id);
  }

  @override
  ParamWrapper<Gradient> gradient(String id) {
    return param(id);
  }

  // Data types

  @override
  SingleChoiceParamWrapper<T> single<T>(String id, List<T> values) {
    return SingleChoiceParamWrapper(values: values) //
      ..value = defaultValues[id];
  }

  @override
  MultiChoiceParamWrapper<T> multi<T>(String id, List<T> values) {
    return MultiChoiceParamWrapper(values: values) //
      ..value = defaultValues[id];
  }

  // Generated

  @override
  ParamWrapper<T> dynamic$<T>(String id) {
    return param(id);
  }

  @override
  T defaultFor<T>(ParamWrapper<T> param) {
    throw UnimplementedError();
  }
}
