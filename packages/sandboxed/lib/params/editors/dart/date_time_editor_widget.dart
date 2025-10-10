import 'package:flutter/material.dart';
import 'package:sandboxed/sandboxed.dart';
import 'package:sandboxed/widgets/listenable_listener.dart';

class DateTimeEditorPresenter extends ValueEditorPresenter<DateTime> {
  final DateTimeEditor editor;

  const DateTimeEditorPresenter(this.editor);

  @override
  Widget build(BuildContext context, ParamValue<DateTime> value) {
    return DateTimeEditorWidget(value: value);
  }
}

class DateTimeEditorWidget extends StatefulWidget {
  final ParamValue<DateTime> value;

  const DateTimeEditorWidget({
    super.key,
    required this.value,
  });

  @override
  State<DateTimeEditorWidget> createState() => _DateTimeEditorWidgetState();
}

class _DateTimeEditorWidgetState extends State<DateTimeEditorWidget> {
  final TextEditingController controller = TextEditingController();

  String? error;

  String serialize(DateTime value) {
    return value.toIso8601String();
  }

  DateTime deserialize(String value) {
    return DateTime.parse(value.trim());
  }

  @override
  void initState() {
    controller.text = serialize(widget.value.value ?? DateTime.now());
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableListener(
      listenable: widget.value,
      onChange: () {
        DateTime? current;
        try {
          current = deserialize(controller.text);
        } catch (e) {/* ignore format exception */}

        if (widget.value.value == null) {
          return;
        }

        if (current != widget.value.value) {
          controller.text = serialize(widget.value.value!);
          error = null;
        }
      },
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          helperText: error,
          helperStyle: TextStyle(color: Colors.redAccent),
        ),
        onChanged: (value) {
          try {
            final nextValue = deserialize(value);
            setState(() => error = null);

            widget.value.update(nextValue);
          } catch (e) {
            setState(() => error = e.toString());
          }
        },
      ),
    );
  }
}
