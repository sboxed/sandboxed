import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sandboxed_core/sandboxed_core.dart';

// TODO(@melvspace): 10/11/25 support json schema?
class JsonEditorPresenter<T> extends ValueEditorPresenter<T> {
  final JsonEditor<T> editor;

  const JsonEditorPresenter(this.editor);

  @override
  ValueEditorPresenter<TOther> cast<TOther extends T>() {
    return JsonEditorPresenter<TOther>(
      editor as JsonEditor<TOther>,
    );
  }

  @override
  Widget build(BuildContext context, ParamValue<T> value) {
    return JsonEditorWidget(
      value: value,
      toJson: editor.toJson,
      fromJson: editor.fromJson,
    );
  }
}

class JsonEditorWidget<T> extends StatefulWidget {
  final ParamValue<T> value;

  final Map<String, dynamic> Function(T value) toJson;
  final T Function(Map<String, dynamic> json) fromJson;

  const JsonEditorWidget({
    super.key,
    required this.value,
    required this.toJson,
    required this.fromJson,
  });

  @override
  State<JsonEditorWidget<T>> createState() => _JsonEditorWidgetState<T>();
}

class _JsonEditorWidgetState<T> extends State<JsonEditorWidget<T>> {
  final TextEditingController controller = TextEditingController();

  String? error;

  void update() {
    Map<String, dynamic> value;
    try {
      value = jsonDecode(controller.text);
    } catch (e) {
      value = {};
    }

    if (widget.value.value == null) {
      return;
    }

    final newValue = widget.toJson(widget.value.value as T);
    if (mapEquals(value, newValue)) return;
    if (error != null) return;

    if (widget.value.value == null) {
      controller.text = '{}';
    } else {
      controller.text = JsonEncoder.withIndent("  ")
          .convert(widget.toJson(widget.value.value as T));
    }
  }

  @override
  void initState() {
    update();
    widget.value.addListener(update);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant JsonEditorWidget<T> oldWidget) {
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
      maxLines: null,
      decoration: InputDecoration(
        helper: error != null
            ? Text(
                error!,
                style: TextStyle(color: Colors.redAccent),
              )
            : null,
      ),
      onChanged: (value) {
        final T object;
        try {
          object = widget.fromJson(jsonDecode(value));
          error = null;
        } catch (e) {
          setState(() => error = e.toString());
          return;
        }

        widget.value.update(object);
      },
    );
  }
}
