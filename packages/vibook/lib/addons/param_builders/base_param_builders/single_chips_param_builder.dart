import 'package:flutter/material.dart';
import 'package:vibook/params/param_builder.dart';
import 'package:vibook/params/params_notifier.dart';
import 'package:vibook_core/param.dart';
import 'package:vibook_core/params/list_param.dart';

final class ChipsType extends ListParamType {}

class SingleChipsParamBuilder<T> extends ParamBuilder<T> {
  @override
  Widget build(String id, Param<T> param, ParamsNotifier params) {
    final listParam = param as SingleParam<T>;

    return Wrap(
      spacing: 5.0,
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
  bool canBuild(Param param) {
    return param is SingleParam<T> && param.type is ChipsType;
  }
}

class MultiChipsParamBuilder<T> extends ParamBuilder<T> {
  @override
  Widget build(String id, Param<T> param, ParamsNotifier params) {
    final multi = param as MultiParam<T>;

    return Wrap(
      spacing: 5.0,
      children: [
        for (final choice in multi.values)
          ChoiceChip(
            selected: multi.value.contains(choice),
            label: Text(
              switch (choice) {
                Enum choice => choice.name,
                _ => choice.toString(),
              },
            ),
            onSelected: (selected) {
              // TODO(@melvspace): 03/05/25 fix type errors.
              if (selected) {
                params.update<List<T>>(
                    id, ([...multi.value]..remove(choice)).cast<T>());
              } else {
                params.update<List<T>>(id, [...multi.value, choice].cast<T>());
              }
            },
          )
      ],
    );
  }

  @override
  bool canBuild(Param param) {
    return param is MultiParam && param.type is ChipsType;
  }
}
