import 'package:flutter/material.dart';
import 'package:sandboxed_core/sandboxed_core.dart';

class SingleChipsEditorPresenter<T> extends ValueEditorPresenter<T> {
  final SingleChipsEditor<T> editor;

  const SingleChipsEditorPresenter(this.editor);

  @override
  ValueEditorPresenter<TOther> cast<TOther extends T>() {
    return SingleChipsEditorPresenter(editor as SingleChipsEditor<TOther>);
  }

  @override
  Widget build(BuildContext context, ParamValue<T> value) {
    return SingleChipsEditorWidget(
      value: value,
      values: editor.values,
      label: editor.label,
    );
  }
}

class SingleChipsEditorWidget<T> extends StatefulWidget {
  final ParamValue<T> value;
  final LabelBuilder<T> label;
  final List<T> values;

  const SingleChipsEditorWidget({
    super.key,
    required this.value,
    required this.values,
    required this.label,
  });

  @override
  State<SingleChipsEditorWidget<T>> createState() =>
      _SingleChipsEditorWidgetState();
}

class _SingleChipsEditorWidgetState<T>
    extends State<SingleChipsEditorWidget<T>> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        for (final choice in widget.values)
          ChoiceChip(
            selected: widget.value.value == choice,
            label: Text(widget.label(choice)),
            onSelected: (selected) {
              if (selected) {
                widget.value.update(choice);
              }
            },
          )
      ],
    );
  }
}
