import 'package:flutter/material.dart';
import 'package:sandboxed/addons/alignment/alignment_picker.dart';
import 'package:sandboxed/params/param_builder.dart';
import 'package:sandboxed/params/params_notifier.dart';
import 'package:sandboxed_core/sandboxed_core.dart';

class AlignmentParamBuilder extends ParamBuilder<Alignment> {
  @override
  Alignment getInitialValueFor(ParamWrapper<Alignment> param) =>
      Alignment.center;

  @override
  Widget build(
    String id,
    ParamWrapper<Alignment> param,
    ParamsNotifier params,
  ) {
    return AlignmentPicker(
      onChanged: (value) => params.update(id, value),
      value: param.value ?? getInitialValueFor(param),
    );
  }

  @override
  bool canBuild(ParamWrapper param) {
    return param is ParamWrapper<Alignment>;
  }
}
