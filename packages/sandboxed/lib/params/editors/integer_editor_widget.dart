import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sandboxed_core/sandboxed_core.dart';

class IntegerEditorPresenter extends ValueEditorPresenter<int> {
  final IntegerEditor editor;

  const IntegerEditorPresenter(this.editor);

  @override
  Widget build(BuildContext context, ParamValue<int> value) {
    return IntegerEditorWidget(value: value);
  }
}

/// Allowed numbers
///
/// - `-123`
/// - `123`
/// - `0`
/// - `000`
/// - `-0`
/// - `-000`
/// - `123_456_789`
/// - `-123_456_789`
class IntegerEditorWidget extends StatefulWidget {
  final ParamValue<int> value;

  const IntegerEditorWidget({super.key, required this.value});

  @override
  State<IntegerEditorWidget> createState() => _IntegerEditorWidgetState();
}

class _IntegerEditorWidgetState extends State<IntegerEditorWidget> {
  late final TextEditingController controller =
      TextEditingController(text: stringify(widget.value.value));

  String stringify(int? value) => value?.toString() ?? '0';

  int parse(String value) => int.tryParse(value.replaceAll('_', '')) ?? 0;

  void update() {
    if (widget.value.value != parse(controller.text) ||
        controller.text.isEmpty) {
      controller.text = stringify(widget.value.value);
    }
  }

  @override
  void initState() {
    widget.value.addListener(update);

    super.initState();
  }

  @override
  void didUpdateWidget(covariant IntegerEditorWidget oldWidget) {
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
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^-?[\d_]*$')),
        FilteringTextInputFormatter.deny(RegExp(r"__+")),
        FilteringTextInputFormatter.deny(RegExp(r"^_"))
      ],
      onChanged: (value) => widget.value.update(parse(value)),
    );
  }
}
