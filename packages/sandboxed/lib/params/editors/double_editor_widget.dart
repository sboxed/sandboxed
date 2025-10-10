import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sandboxed_core/sandboxed_core.dart';

class DoubleEditorPresenter extends ValueEditorPresenter<double> {
  final DoubleEditor editor;

  const DoubleEditorPresenter(this.editor);

  @override
  Widget build(BuildContext context, ParamValue<double> value) {
    return DoubleEditorWidget(value: value);
  }
}

/// Allowed numbers
///
/// - `-123.45`
/// - `123.45`
/// - `0.123`
/// - `000.123`
/// - `-0.123`
/// - `-000.123`
/// - `123_456_789.123_456_789`
/// - `-123_456_789.123_456_789`
/// - `.523`
/// - `-.523`
class DoubleEditorWidget extends StatefulWidget {
  final ParamValue<double> value;

  const DoubleEditorWidget({super.key, required this.value});

  @override
  State<DoubleEditorWidget> createState() => _DoubleEditorWidgetState();
}

class _DoubleEditorWidgetState extends State<DoubleEditorWidget> {
  late final TextEditingController controller =
      TextEditingController(text: stringify(widget.value.value));

  String stringify(double? value) => value?.toString() ?? '0.0';

  double parse(String value) =>
      double.tryParse(
        value.replaceAll('_', ''),
      ) ??
      0.0;

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
  void dispose() {
    widget.value.removeListener(update);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r"^-?[0-9._]*$")),
        FilteringTextInputFormatter.deny(RegExp(r"__+")),
        FilteringTextInputFormatter.deny(RegExp(r"^_")),
        TextInputFormatter.withFunction((oldValue, newValue) {
          final text = newValue.text;
          if (text == ".") return newValue;
          if (text == "-") return newValue;
          if (text == "-.") return newValue;

          return text.isEmpty
              ? newValue
              : double.tryParse(text.replaceAll('_', '')) == null
                  ? oldValue
                  : newValue;
        }),
      ],
      onChanged: (value) => widget.value.update(parse(value)),
    );
  }
}
