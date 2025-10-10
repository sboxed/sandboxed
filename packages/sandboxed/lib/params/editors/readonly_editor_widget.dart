import 'package:flutter/material.dart';
import 'package:sandboxed_core/sandboxed_core.dart';

class ReadonlyEditorPresenter<T> extends ValueEditorPresenter<T> {
  final ReadonlyEditor<T> editor;

  const ReadonlyEditorPresenter(this.editor);

  @override
  Widget build(BuildContext context, ParamValue value) {
    return ReadonlyEditorWidget(value: value);
  }
}

class ReadonlyEditorWidget extends StatefulWidget {
  final ParamValue value;

  const ReadonlyEditorWidget({super.key, required this.value});

  @override
  State<ReadonlyEditorWidget> createState() => _ReadonlyEditorWidgetState();
}

class _ReadonlyEditorWidgetState extends State<ReadonlyEditorWidget> {
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.value,
      builder: (context, child) => Text(widget.value.value.toString()),
    );
  }
}
