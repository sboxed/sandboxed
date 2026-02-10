import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sandboxed/sandboxed.dart';
import 'package:sandboxed/widgets/listenable_listener.dart';

/// Format a Duration as a human-readable string (e.g., "1d 2h 3m 4s")
String _prettyDuration(Duration duration) {
  final days = duration.inDays;
  final hours = duration.inHours.remainder(24);
  final minutes = duration.inMinutes.remainder(60);
  final seconds = duration.inSeconds.remainder(60);
  final ms = duration.inMilliseconds.remainder(1000);

  final parts = <String>[];
  if (days > 0) parts.add('${days}d');
  if (hours > 0) parts.add('${hours}h');
  if (minutes > 0) parts.add('${minutes}m');
  if (seconds > 0) parts.add('${seconds}s');
  if (ms > 0 && parts.isEmpty) parts.add('${ms}ms');

  return parts.isEmpty ? '0s' : parts.join(' ');
}

/// Parse a duration string (e.g., "1d 2h 3m 4s") into a Duration
Duration _parseDuration(String input) {
  final pattern = RegExp(r'(\d+)(d|h|m|s|ms)');
  final matches = pattern.allMatches(input);

  var totalMs = 0;
  for (final match in matches) {
    final value = int.parse(match.group(1)!);
    final unit = match.group(2)!;

    totalMs += switch (unit) {
      'd' => value * 24 * 60 * 60 * 1000,
      'h' => value * 60 * 60 * 1000,
      'm' => value * 60 * 1000,
      's' => value * 1000,
      'ms' => value,
      _ => 0,
    };
  }

  return Duration(milliseconds: totalMs);
}

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

  String serialize(Duration value) => _prettyDuration(value);

  Duration deserialize(String value) {
    return _parseDuration(value.trim());
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
