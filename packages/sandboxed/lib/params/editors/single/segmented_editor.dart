import 'package:flutter/material.dart';
import 'package:sandboxed_core/sandboxed_core.dart';

class SingleSegmentedEditorPresenter<T> extends ValueEditorPresenter<T> {
  final SingleSegmentedEditor editor;

  const SingleSegmentedEditorPresenter(this.editor);

  @override
  ValueEditorPresenter<TOther> cast<TOther extends T>() {
    return SingleSegmentedEditorPresenter(
      editor as SingleSegmentedEditor<TOther>,
    );
  }

  @override
  Widget build(BuildContext context, ParamValue<T> value) {
    return SingleSegmentedEditorWidget(
      value: value,
      values: editor.values,
      label: editor.label,
    );
  }
}

class SingleSegmentedEditorWidget<T> extends StatefulWidget {
  final ParamValue<T> value;
  final LabelBuilder<T> label;
  final List<T> values;

  const SingleSegmentedEditorWidget({
    super.key,
    required this.value,
    required this.values,
    required this.label,
  });

  @override
  State<SingleSegmentedEditorWidget<T>> createState() =>
      _SingleSegmentedEditorWidgetState();
}

class _SingleSegmentedEditorWidgetState<T>
    extends State<SingleSegmentedEditorWidget<T>> {
  @override
  Widget build(BuildContext context) {
    return SegmentedButton<T>(
      onSelectionChanged: (value) => widget.value.update(value.single),
      segments: [
        for (final value in widget.values)
          ButtonSegment(
            value: value,
            tooltip: widget.label(value),
            label: Text(widget.label(value)),
            enabled: true,
          )
      ],
      selected: {
        if (widget.value.value case T value) //
          value,
      },
    );
  }
}
