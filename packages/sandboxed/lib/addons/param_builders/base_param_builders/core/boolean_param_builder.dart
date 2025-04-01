import 'package:flutter/material.dart';
import 'package:sandboxed/params/param_builder.dart';
import 'package:sandboxed/params/params_notifier.dart';
import 'package:sandboxed_core/sandboxed_core.dart';

class BooleanParamBuilder extends ParamBuilder<bool> {
  @override
  bool getInitialValueFor(ParamWrapper<bool> param) => false;

  @override
  Widget build(String id, ParamWrapper<bool> param, ParamsNotifier params) {
    return Switch(
      value: param.value ?? getInitialValueFor(param),
      onChanged: (value) => params.update(id, value),
    );
  }

  @override
  bool canBuild(ParamWrapper param) {
    return param is ParamWrapper<bool>;
  }
}
