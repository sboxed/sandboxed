import 'package:flutter/material.dart';
import 'package:vibook/params/param_builder.dart';
import 'package:vibook/params/params_notifier.dart';
import 'package:vibook/widgets/vi_color_picker.dart';
import 'package:vibook_core/param.dart';

class ColorParamBuilder extends ParamBuilder<Color> {
  @override
  Widget build(String id, Param<Color> param, ParamsNotifier params) {
    return ViColorPicker(
      value: param.value,
      onChanged: (value) => params.update(id, value),
    );
  }

  @override
  bool canBuild(Param param) {
    return param is Param<Color>;
  }
}
