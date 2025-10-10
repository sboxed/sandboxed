import 'package:flutter/material.dart';
import 'package:sandboxed_core/sandboxed_core.dart';

class StringEditorPresenter extends ValueEditorPresenter<String> {
  final StringEditor editor;

  const StringEditorPresenter(this.editor);

  @override
  Widget build(BuildContext context, ParamValue<String> value) {
    return StringEditorWidget(
      value: value,
      minLines: editor.minLines,
      maxLines: editor.maxLines,
    );
  }
}

class StringEditorWidget extends StatefulWidget {
  final ParamValue<String> value;

  final int? minLines;
  final int? maxLines;

  const StringEditorWidget({
    super.key,
    required this.value,
    this.minLines,
    this.maxLines = 1,
  });

  @override
  State<StringEditorWidget> createState() => _StringEditorWidgetState();
}

class _StringEditorWidgetState extends State<StringEditorWidget> {
  late final TextEditingController controller =
      TextEditingController(text: widget.value.value);

  void update() {
    if (widget.value.value == null) {
      controller.text = '';
    } else {
      if (controller.text != widget.value.value) {
        controller.text = widget.value.value!;
      }
    }
  }

  @override
  void initState() {
    widget.value.addListener(update);

    super.initState();
  }

  @override
  void didUpdateWidget(covariant StringEditorWidget oldWidget) {
    oldWidget.value.removeListener(update);
    widget.value.addListener(update);

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    widget.value.removeListener(update);
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      minLines: widget.minLines,
      maxLines: widget.maxLines,
      onChanged: (value) => widget.value.update(value),
    );
  }
}
