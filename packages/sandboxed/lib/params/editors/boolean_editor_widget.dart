import 'package:flutter/material.dart';
import 'package:sandboxed_core/sandboxed_core.dart';

class BooleanEditorPresenter extends ValueEditorPresenter<bool> {
  final BooleanEditor editor;

  BooleanEditorPresenter(this.editor);

  @override
  Widget build(BuildContext context, ParamValue<bool> value) {
    return BooleanEditorWidget(value: value);
  }
}

class BooleanEditorWidget extends StatefulWidget {
  final ParamValue<bool> value;

  const BooleanEditorWidget({super.key, required this.value});

  @override
  State<BooleanEditorWidget> createState() => _BooleanEditorWidgetState();
}

class _BooleanEditorWidgetState extends State<BooleanEditorWidget> {
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.value,
      builder: (context, child) => Switch(
        value: widget.value.value == true,
        onChanged: (value) => widget.value.update(value),
      ),
    );
  }
}
