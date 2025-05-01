import 'package:flutter/widgets.dart';
import 'package:sandboxed_core/src/params/default_value_resolver.dart';
import 'package:sandboxed_core/src/params/list_param.dart';
import 'package:sandboxed_core/src/params/param_wrapper.dart';
import 'package:sandboxed_core/src/params/params_store.dart';

class ConstantParams implements Params {
  late DefaultValueResolver _defaultValueResolver = DefaultValueResolver(
    params: this,
    defaultValues: {},
  );

  ConstantParams();

  @override
  void update<T>(String id, T value) {}

  @override
  void updateDefaultValues(Map<String, dynamic> defaultValues) {
    _defaultValueResolver = DefaultValueResolver(
      params: this,
      defaultValues: {...defaultValues},
    );
  }

  @override
  void reset() {}

  ParamWrapper<T> param<T, T1, T2>(String id) {
    return ParamWrapper() //
      ..bind(id, this)
      ..value = _defaultValueResolver.getDefaultValue<T, T1, T2>(id);
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
      ..value = _defaultValueResolver.defaultValues[id];
  }

  @override
  MultiChoiceParamWrapper<T> multi<T>(String id, List<T> values) {
    return MultiChoiceParamWrapper(values: values) //
      ..value = _defaultValueResolver.defaultValues[id];
  }

  // Generated

  @override
  ParamWrapper<T> dynamic$<T, T1, T2>(String id) {
    return param<T, T1, T2>(id);
  }

  @override
  T defaultFor<T>(ParamWrapper<T> param) {
    return _defaultValueResolver.defaultValues[param.id] as T;
  }
}
