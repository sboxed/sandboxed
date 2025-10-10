import 'package:flutter/material.dart';
import 'package:sandboxed_core/sandboxed_core.dart';

class EdgeInsetsValueEditorPresenter
    extends ValueEditorPresenter<EdgeInsetsGeometry> {
  final ParamEditor<EdgeInsetsGeometry> editor;

  const EdgeInsetsValueEditorPresenter(this.editor);

  @override
  Widget build(BuildContext context, ParamValue<EdgeInsetsGeometry> value) {
    return EdgeInsetsEditorWidget(value: value);
  }
}

// TODO(@melvspace): 04/02/25 implement edge insets editor
class EdgeInsetsEditorWidget extends StatelessWidget {
  final ParamValue<EdgeInsetsGeometry> value;

  const EdgeInsetsEditorWidget({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) => this.value.update(
            EdgeInsets.all(double.tryParse(value) ?? 0),
          ),
    );
  }
}
