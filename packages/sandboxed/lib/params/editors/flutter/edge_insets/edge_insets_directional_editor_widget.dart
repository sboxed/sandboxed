import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:sandboxed_ui_kit/sandboxed_ui_kit.dart';

enum EdgeInsetsDirectionalFormat {
  tsbe,
  thb,
  vh,
  all,
}

/// - When **one** value is specified, it applies the same padding to **all four sides**.
/// - When **two** values are specified, the first padding applies to the **top and bottom**, the second to the **left and right**.
/// - When **three** values are specified, the first padding applies to the **top**, the second to the **right and left**, the third to the **bottom**.
/// - When **four** values are specified, the paddings apply to the **top**, **right**, **bottom**, and **left** in that order (clockwise).
class EdgeInsetsDirectionalEditorWidget extends StatefulWidget {
  final EdgeInsetsDirectional value;
  final void Function(EdgeInsetsDirectional value) onValueChange;

  final Widget? trailing;

  const EdgeInsetsDirectionalEditorWidget({
    super.key,
    required this.value,
    required this.onValueChange,
    this.trailing,
  });

  @override
  State<EdgeInsetsDirectionalEditorWidget> createState() =>
      _EdgeInsetsDirectionalEditorWidgetState();
}

class _EdgeInsetsDirectionalEditorWidgetState
    extends State<EdgeInsetsDirectionalEditorWidget> {
  final TextEditingController controller = TextEditingController();

  String? error;

  EdgeInsetsDirectionalFormat get format {
    final value = controller.text.trim().replaceAll(RegExp(r'\s+'), ' ');
    final parts = value.split(' ');

    if (parts.length == 1) {
      return EdgeInsetsDirectionalFormat.all;
    } else if (parts.length == 2) {
      return EdgeInsetsDirectionalFormat.vh;
    } else if (parts.length == 3) {
      return EdgeInsetsDirectionalFormat.thb;
    } else {
      return EdgeInsetsDirectionalFormat.tsbe;
    }
  }

  String serialize(EdgeInsetsDirectional value) {
    final top = value.top;
    final end = value.end;
    final bottom = value.bottom;
    final start = value.start;

    final set = {top, start, end, bottom};

    // Apply to all four sides
    if (set.length == 1) {
      return top.toString();
    }

    // top and bottom | start and end
    if (top == bottom && start == end) {
      return "$top $start";
    }

    // top | end and start | bottom
    if (start == end) {
      return "$top $start $bottom";
    }

    // top | end | bottom | start
    return "$top $end $bottom $start";
  }

  EdgeInsetsDirectional deserialize(String value) {
    value = value.trim().replaceAll(RegExp(r'\s+'), ' ');
    if (value.isEmpty) return EdgeInsetsDirectional.zero;

    final parts = value.split(' ');

    if (parts.length == 1) {
      return EdgeInsetsDirectional.all(
        double.parse(parts[0]),
      );
    }

    if (parts.length == 2) {
      return EdgeInsetsDirectional.symmetric(
        vertical: double.parse(parts[0]),
        horizontal: double.parse(parts[1]),
      );
    }

    if (parts.length == 3) {
      return EdgeInsetsDirectional.only(
        top: double.parse(parts[0]),
        end: double.parse(parts[1]),
        bottom: double.parse(parts[2]),
        start: double.parse(parts[1]),
      );
    }

    if (parts.length == 4) {
      return EdgeInsetsDirectional.only(
        top: double.parse(parts[0]),
        end: double.parse(parts[1]),
        bottom: double.parse(parts[2]),
        start: double.parse(parts[3]),
      );
    }

    return EdgeInsetsDirectional.zero;
  }

  @override
  void initState() {
    controller.text = serialize(widget.value);

    super.initState();
  }

  @override
  void didUpdateWidget(covariant EdgeInsetsDirectionalEditorWidget oldWidget) {
    if (widget.value != oldWidget.value &&
        widget.value != deserialize(controller.text)) {
      controller.text = serialize(widget.value);
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return SBTooltip(
      constrained: true,
      tooltip: MarkdownBody(
        data: """
The property may be specified using one, two, three, or four values. Each value is a **double**.

- When **one** value is specified, it applies the same padding to **all four sides**.
- When **two** values are specified, the first padding applies to the **top and bottom**, the second to the **start and end**.
- When **three** values are specified, the first padding applies to the **top**, the second to the **end and start**, the third to the **bottom**.
- When **four** values are specified, the paddings apply to the **top**, **end**, **bottom**, and **start** in that order (clockwise).
""",
      ),
      child: TextField(
        controller: controller,
        onChanged: (text) {
          try {
            final value = deserialize(text);
            setState(() => error = null);
            widget.onValueChange(value);
          } catch (e) {
            setState(() => error = e.toString());
          }
        },
        decoration: InputDecoration(
          suffix: widget.trailing,
          helperStyle:
              error != null ? TextStyle(color: Colors.redAccent) : null,
          helperText: error ??
              switch (format) {
                EdgeInsetsDirectionalFormat.tsbe => "top end bottom start",
                EdgeInsetsDirectionalFormat.thb => "top horizontal bottom",
                EdgeInsetsDirectionalFormat.vh => "vertical horizontal",
                EdgeInsetsDirectionalFormat.all => "all",
              },
        ),
      ),
    );
  }
}
