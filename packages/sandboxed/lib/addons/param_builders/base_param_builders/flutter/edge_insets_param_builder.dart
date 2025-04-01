import 'package:flutter/material.dart';
import 'package:sandboxed/params/param_builder.dart';
import 'package:sandboxed/params/params_notifier.dart';
import 'package:sandboxed_core/sandboxed_core.dart';

// TODO(@melvspace): 04/02/25 add edge insets editor
class EdgeInsetsParamBuilder extends ParamBuilder<EdgeInsetsGeometry> {
  @override
  EdgeInsetsGeometry getInitialValueFor(
          ParamWrapper<EdgeInsetsGeometry> param) =>
      EdgeInsets.zero;

  @override
  Widget build(
    String id,
    ParamWrapper<EdgeInsetsGeometry> param,
    ParamsNotifier params,
  ) {
    return TextField(
      onChanged: (value) => params.update(
        id,
        EdgeInsets.all(double.tryParse(value) ?? 0),
      ),
    );
  }

  @override
  bool canBuild(ParamWrapper param) {
    return param is ParamWrapper<EdgeInsets> ||
        param is ParamWrapper<EdgeInsetsGeometry>;
  }
}
