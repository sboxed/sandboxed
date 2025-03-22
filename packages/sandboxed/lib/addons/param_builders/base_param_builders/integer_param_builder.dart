import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sandboxed/params/param_builder.dart';
import 'package:sandboxed/params/params_notifier.dart';
import 'package:sandboxed_core/sandboxed_core.dart';

class IntegerParamBuilder extends ParamBuilder<int> {
  @override
  int getInitialValueFor(ParamWrapper<int> param) => 0;

  @override
  Widget build(String id, ParamWrapper<int> param, ParamsNotifier params) {
    return _IntegerEditor(
      value: param.value ?? getInitialValueFor(param),
      onChanged: (value) => params.update(id, value),
    );
  }

  @override
  bool canBuild(ParamWrapper param) {
    return param is ParamWrapper<int>;
  }
}

class _IntegerEditor extends StatefulWidget {
  final int value;
  final ValueChanged<int> onChanged;

  const _IntegerEditor({
    required this.value,
    required this.onChanged,
  });

  @override
  State<_IntegerEditor> createState() => _IntegerEditorState();
}

class _IntegerEditorState extends State<_IntegerEditor> {
  final focus = FocusNode();
  late final TextEditingController controller =
      TextEditingController(text: widget.value.toString());

  @override
  void initState() {
    focus.addListener(
      () {
        if (!focus.hasPrimaryFocus && controller.text.isEmpty) {
          controller.text = '0';
          widget.onChanged(0);
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    focus.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focus,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'\d'))],
      onChanged: (value) {
        final intValue = int.tryParse(value);

        if (intValue case int value) {
          widget.onChanged(value);
        }
      },
      controller: controller,
    );
  }
}
