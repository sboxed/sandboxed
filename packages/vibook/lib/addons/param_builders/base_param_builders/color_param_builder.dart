import 'package:flutter/material.dart';
import 'package:vibook/params/param_builder.dart';
import 'package:vibook/params/params_notifier.dart';
import 'package:vibook/widgets/vi_color_picker.dart';
import 'package:vibook_core/vibook_core.dart';

class ColorParamBuilder extends ParamBuilder<Color> {
  @override
  Color getInitialValueFor(ParamWrapper<Color> param) => Colors.black;

  @override
  Widget build(String id, ParamWrapper<Color> param, ParamsNotifier params) {
    return ViColorPicker(
      value: param.rawValue ?? getInitialValueFor(param),
      onChanged: (value) => params.update(id, value),
    );
  }

  @override
  bool canBuild(ParamWrapper param) {
    return param is ParamWrapper<Color>;
  }
}
