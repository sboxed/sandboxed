import 'package:flutter/material.dart';
import 'package:sandboxed/addons/alignment/alignment_picker.dart';
import 'package:sandboxed_core/sandboxed_core.dart';

class AlignmentParamEditorPresenter extends ValueEditorPresenter<Alignment> {
  final ParamEditor<AlignmentGeometry> editor;

  const AlignmentParamEditorPresenter(this.editor);

  @override
  Widget build(BuildContext context, ParamValue<Alignment> value) {
    return AlignmentParamBuilder(value: value);
  }
}

class AlignmentParamBuilder extends StatelessWidget {
  final ParamValue<Alignment> value;

  const AlignmentParamBuilder({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return AlignmentPicker(
      value: value.value ?? Alignment.center,
      onChanged: (value) => this.value.update(value),
    );
  }
}
