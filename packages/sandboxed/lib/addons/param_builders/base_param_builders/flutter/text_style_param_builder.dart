import 'package:flutter/material.dart';
import 'package:sandboxed/params/param_builder.dart';
import 'package:sandboxed/params/params_notifier.dart';
import 'package:sandboxed/sandboxed.dart';

// TODO(@melvspace): 04/02/25 handle other fields
class TextStyleParamBuilder extends ParamBuilder<TextStyle> {
  @override
  TextStyle getInitialValueFor(ParamWrapper<TextStyle> param) =>
      const TextStyle();

  @override
  Widget build(
    String id,
    ParamWrapper<TextStyle> param,
    ParamsNotifier params,
  ) {
    return ChipsPicker(
      value: param.value?.fontWeight,
      values: [
        for (final weight in FontWeight.values) //
          (weight, weight.value.toString()),
      ],
      onSelected: (value) => params.update(id, TextStyle(fontWeight: value)),
    );
  }

  @override
  bool canBuild(ParamWrapper param) {
    return param is ParamWrapper<TextStyle>;
  }
}
