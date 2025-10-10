import 'package:flutter/material.dart';
import 'package:sandboxed_core/sandboxed_core.dart';

class MultiSegmentedEditorPresenter<T> extends ValueEditorPresenter<List<T>> {
  final MultiSegmentedEditor<T> editor;

  const MultiSegmentedEditorPresenter(this.editor);

  @override
  Widget build(BuildContext context, ParamValue<List<T>> value) {
    return MultiSegmentedEditorWidget<T>(
      value: value,
      values: editor.values,
      label: editor.label,
    );
  }
}

class MultiSegmentedEditorWidget<T> extends StatefulWidget {
  final ParamValue<List<T>> value;
  final LabelBuilder<T> label;
  final List<T> values;

  const MultiSegmentedEditorWidget({
    super.key,
    required this.value,
    required this.values,
    required this.label,
  });

  @override
  State<MultiSegmentedEditorWidget<T>> createState() =>
      _MultiSegmentedEditorWidgetState();
}

class _MultiSegmentedEditorWidgetState<T>
    extends State<MultiSegmentedEditorWidget<T>> {
  @override
  Widget build(BuildContext context) {
    return SegmentedButton<T>(
      multiSelectionEnabled: true,
      onSelectionChanged: (set) {
        widget.value.update(set.toList());
      },
      segments: [
        for (final value in widget.values)
          ButtonSegment(
            value: value,
            tooltip: widget.label(value),
            label: Text(widget.label(value)),
          )
      ],
      selected: {
        for (final value in widget.value.value ?? []) //
          value,
      },
    );
  }
}
