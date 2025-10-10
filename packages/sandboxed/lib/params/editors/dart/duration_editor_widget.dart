import 'package:duration/duration.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sandboxed/sandboxed.dart';
import 'package:sandboxed/widgets/listenable_listener.dart';

class DurationEditorPresenter extends ValueEditorPresenter<Duration> {
  final DurationEditor editor;

  const DurationEditorPresenter(this.editor);

  @override
  Widget build(BuildContext context, ParamValue<Duration> value) {
    return DurationEditorWidget(value: value);
  }
}

class DurationEditorWidget extends StatefulWidget {
  final ParamValue<Duration> value;

  const DurationEditorWidget({
    super.key,
    required this.value,
  });

  @override
  State<DurationEditorWidget> createState() => _DurationEditorWidgetState();
}

class _DurationEditorWidgetState extends State<DurationEditorWidget> {
  final TextEditingController controller = TextEditingController();

  String? error;

  String serialize(Duration value) => value.pretty(
        abbreviated: true,
        spacer: "",
        delimiter: " ",
      );

  Duration deserialize(String value) {
    return parseDuration(value.trim(), separator: " ");
  }

  @override
  void initState() {
    controller.text = serialize(widget.value.value ?? Duration.zero);
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
        Duration? current;
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
        inputFormatters: [
          FilteringTextInputFormatter.deny(RegExp(r"\s\s+")),
        ],
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
