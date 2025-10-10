import 'package:flutter/material.dart';
import 'package:sandboxed_core/sandboxed_core.dart';

extension RebindMultiChips on MultiChipsEditorPresenter<dynamic> {
  MultiChipsEditorPresenter<S> rebind<S>() {
    final e = editor as MultiChipsEditor<S>;
    return MultiChipsEditorPresenter<S>(e);
  }
}

class MultiChipsEditorPresenter<T> extends ValueEditorPresenter<List<T>> {
  final MultiChipsEditor<T> editor;

  const MultiChipsEditorPresenter(this.editor);

  @override
  ValueEditorPresenter<TOther> cast<TOther extends List<T>>() {
    return MultiChipsEditorPresenter<T>(editor as dynamic)
        as ValueEditorPresenter<TOther>;
  }

  @override
  Widget build(BuildContext context, ParamValue<List<T>> value) {
    return MultiChipsEditorWidget(
      value: value,
      values: editor.values,
      label: editor.label,
    );
  }
}

class MultiChipsEditorWidget<T> extends StatefulWidget {
  final ParamValue<List<T>> value;
  final LabelBuilder<T> label;
  final List<T> values;

  const MultiChipsEditorWidget({
    super.key,
    required this.value,
    required this.values,
    required this.label,
  });

  @override
  State<MultiChipsEditorWidget<T>> createState() =>
      _MultiChipsEditorWidgetState();
}

class _MultiChipsEditorWidgetState<T> extends State<MultiChipsEditorWidget<T>> {
  @override
  Widget build(BuildContext context) {
    final param = widget.value;

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        for (final choice in widget.values)
          ChoiceChip(
            selected: (widget.value.value ?? []).contains(choice),
            label: Text(widget.label(choice)),
            onSelected: (selected) {
              if (selected) {
                param.update([...widget.value.value ?? [], choice]);
              } else {
                param.update([...widget.value.value ?? []]..remove(choice));
              }
            },
          )
      ],
    );
  }
}
