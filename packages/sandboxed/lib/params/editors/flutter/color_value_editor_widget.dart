import 'package:flutter/material.dart';
import 'package:sandboxed_core/sandboxed_core.dart';
import 'package:sandboxed_ui_kit/sandboxed_ui_kit.dart';

class ColorEditorPresenter extends ValueEditorPresenter<Color> {
  final ParamEditor<Color> editor;

  const ColorEditorPresenter(this.editor);

  @override
  Widget build(BuildContext context, ParamValue<Color> value) {
    return ColorValueEditorWidget.builder(context, value);
  }
}

class ColorValueEditorWidget extends StatelessWidget {
  static Widget builder(BuildContext context, ParamValue<Color> value) {
    return ColorValueEditorWidget(value: value);
  }

  final ParamValue<Color> value;

  const ColorValueEditorWidget({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return SBColorPicker(
      value: value.value ?? Colors.black,
      onChanged: (value) => this.value.update(value),
    );
  }
}
