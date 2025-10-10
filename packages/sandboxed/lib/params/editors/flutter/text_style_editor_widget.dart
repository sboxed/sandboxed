import 'package:flutter/material.dart';
import 'package:sandboxed/sandboxed.dart';

class TextStyleEditorPresenter extends ValueEditorPresenter<TextStyle> {
  final ParamEditor<TextStyle> editor;

  const TextStyleEditorPresenter(this.editor);

  @override
  Widget build(BuildContext context, ParamValue<TextStyle> value) {
    return TextStyleEditorWidget.builder(context, value);
  }
}

// TODO(@melvspace): 04/02/25 handle other fields
class TextStyleEditorWidget extends StatelessWidget {
  static Widget builder(BuildContext context, ParamValue<TextStyle> value) {
    return TextStyleEditorWidget(value: value);
  }

  final ParamValue<TextStyle> value;

  const TextStyleEditorWidget({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return ChipsPicker(
      value: value.value?.fontWeight,
      values: [
        for (final weight in FontWeight.values) //
          (weight, weight.value.toString()),
      ],
      onSelected: (value) => this.value.update(TextStyle(fontWeight: value)),
    );
  }
}
