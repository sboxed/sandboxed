import 'package:flutter/material.dart';
import 'package:vibook/params/param_builder.dart';
import 'package:vibook/params/params_notifier.dart';
import 'package:vibook_core/param.dart';

class StringParamBuilder extends ParamBuilder<String> {
  @override
  Widget build(String id, Param<String> param, ParamsNotifier params) {
    return _EditField(
      param: param,
      onChanged: (value) => params.update(id, value),
    );
  }

  @override
  bool canBuild(Param param) {
    return param is Param<String>;
  }
}

class _EditField extends StatefulWidget {
  final Param<String> param;
  final ValueChanged<String> onChanged;

  const _EditField({
    required this.param,
    required this.onChanged,
  });

  @override
  State<_EditField> createState() => _EditFieldState();
}

class _EditFieldState extends State<_EditField> {
  late final controller = TextEditingController(text: widget.param.value);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: widget.onChanged,
    );
  }
}
