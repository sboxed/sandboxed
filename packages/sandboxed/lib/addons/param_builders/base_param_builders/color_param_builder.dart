import 'package:flutter/material.dart';
import 'package:sandboxed/params/param_builder.dart';
import 'package:sandboxed/params/params_notifier.dart';
import 'package:sandboxed_core/sandboxed_core.dart';
import 'package:sandboxed_ui_kit/sandboxed_ui_kit.dart';

class ColorParamBuilder extends ParamBuilder<Color> {
  @override
  Color getInitialValueFor(ParamWrapper<Color> param) => Colors.black;

  @override
  Widget build(String id, ParamWrapper<Color> param, ParamsNotifier params) {
    return SBColorPicker(
      value: param.rawValue ?? getInitialValueFor(param),
      onChanged: (value) => params.update(id, value),
    );
  }

  @override
  bool canBuild(ParamWrapper param) {
    return param is ParamWrapper<Color>;
  }
}
