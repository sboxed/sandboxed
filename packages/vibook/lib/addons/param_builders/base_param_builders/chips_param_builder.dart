import 'package:flutter/material.dart';
import 'package:vibook/params/param_builder.dart';
import 'package:vibook/params/params_notifier.dart';
import 'package:vibook_core/vibook_core.dart';

class SingleChipsParamBuilder<T> extends ParamBuilder<T> {
  @override
  T? getInitialValueFor(ParamWrapper<T> param) => switch (param) {
        SingleChoiceParamWrapper(values: final values) => values.first,
        _ => null,
      };

  @override
  Widget build(String id, ParamWrapper<T> param, ParamsNotifier params) {
    final listParam = param as SingleChoiceParamWrapper<T>;

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        for (final choice in listParam.values)
          ChoiceChip(
            selected: choice == param.value,
            label: Text(
              switch (choice) {
                Enum choice => choice.name,
                _ => choice.toString(),
              },
            ),
            onSelected: (selected) {
              if (selected) {
                params.update(id, choice);
              }
            },
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

    return Wrap(
      spacing: 5.0,
      children: [
        for (final choice in multi.values)
          ChoiceChip(
            selected: multi.value?.contains(choice) == true,
            label: Text(
              switch (choice) {
                Enum choice => choice.name,
                _ => choice.toString(),
              },
            ),
            onSelected: (selected) {
              if (!selected) {
                params.update<List<T>>(id, ([...?multi.value]..remove(choice)));
              } else {
                params.update<List<T>>(id, [...?multi.value, choice]);
              }
            },
          )
      ],
    );
  }

  @override
  bool canBuild(ParamWrapper param) {
    return param is MultiChoiceParamWrapper<T>;
  }
}
