import 'package:flutter/material.dart';
import 'package:vibook/params/param_builder.dart';
import 'package:vibook/params/params_notifier.dart';
import 'package:vibook_core/param.dart';

class BooleanParamBuilder extends ParamBuilder<bool> {
  @override
  Widget build(String id, Param<bool> param, ParamsNotifier params) {
    return Switch(
      value: param.value,
      onChanged: (value) => params.update(id, value),
    );
  }

  @override
  bool canBuild(Param param) {
    return param is Param<bool>;
  }
}
