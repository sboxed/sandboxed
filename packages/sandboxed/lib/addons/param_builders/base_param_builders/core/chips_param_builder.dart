import 'package:flutter/material.dart';
import 'package:sandboxed/params/param_builder.dart';
import 'package:sandboxed/params/params_notifier.dart';
import 'package:sandboxed/sandboxed.dart';

class SingleChipsParamBuilder<T> extends ParamBuilder<T> {
  @override
  T? getInitialValueFor(ParamWrapper<T> param) => switch (param) {
        SingleChoiceParamWrapper(values: final values) => values.first,
        _ => null,
      };

  @override
  Widget build(String id, ParamWrapper<T> param, ParamsNotifier params) {
    final listParam = param as SingleChoiceParamWrapper<T>;

    return ChipsPicker(
      onSelected: (selected) => params.update(id, selected),
      value: param.value,
      values: [
        for (final value in listParam.values)
          (
            value,
            switch (value) {
              Enum choice => choice.name,
              _ => value.toString(),
            }
          )
      ],
    );
  }

  @override
  bool canBuild(ParamWrapper param) {
    return param is SingleChoiceParamWrapper<T>;
  }
}

class MultiChipsParamBuilder<T> extends ParamBuilder<T> {
  @override
  T? getInitialValueFor(ParamWrapper<T> param) => switch (param) {
        MultiChoiceParamWrapper(values: final values) => values.first,
        _ => null,
      };

  @override
  Widget build(String id, ParamWrapper param, ParamsNotifier params) {
    final multi = param as MultiChoiceParamWrapper<T>;

    return MultiChipsPicker(
      selected: multi.value?.toSet() ?? const {},
      values: [
        for (final value in param.values)
          (
            value,
            switch (value) {
              Enum choice => choice.name,
              _ => value.toString(),
            }
          )
      ],
      onSelected: (value) => params.update<List<T>>(
        id,
        [...?multi.value, value],
      ),
      onDeselected: (value) => params.update<List<T>>(
        id,
        ([...?multi.value]..remove(value)),
      ),
    );
  }

  @override
  bool canBuild(ParamWrapper param) {
    return param is MultiChoiceParamWrapper<T>;
  }
}
