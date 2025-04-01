import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sandboxed/params/param_builder.dart';
import 'package:sandboxed/params/params_notifier.dart';
import 'package:sandboxed_core/sandboxed_core.dart';

class NumberParamBuilder extends ParamBuilder<double> {
  @override
  double getInitialValueFor(ParamWrapper<double> param) => 0;

  @override
  Widget build(String id, ParamWrapper<double> param, ParamsNotifier params) {
    return _NumberEditor(
      value: param.value ?? getInitialValueFor(param),
      onChanged: (value) => params.update(id, value),
    );
  }

  @override
  bool canBuild(ParamWrapper param) {
    return param is ParamWrapper<double>;
  }
}

class _NumberEditor extends StatefulWidget {
  final double value;
  final ValueChanged<double> onChanged;

  const _NumberEditor({
    required this.value,
    required this.onChanged,
  });

  @override
  State<_NumberEditor> createState() => _NumberEditorState();
}

class _NumberEditorState extends State<_NumberEditor> {
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
      inputFormatters: [_DoubleInputFormatter()],
      onChanged: (value) {
        final doubleValue = double.tryParse(value);

        if (doubleValue case double value) {
          widget.onChanged(value);
        }
      },
      controller: controller,
    );
  }
}

class _DoubleInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (RegExp(r'^\d*\.?\d*$').hasMatch(newValue.text)) {
      return newValue;
    }

    return oldValue;
  }
}
