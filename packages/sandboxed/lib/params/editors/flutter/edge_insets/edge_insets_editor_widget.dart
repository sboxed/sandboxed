import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:sandboxed_ui_kit/sandboxed_ui_kit.dart';

enum EdgeInsetsFormat {
  trbl,
  thb,
  vh,
  all,
}

/// - When **one** value is specified, it applies the same padding to **all four sides**.
/// - When **two** values are specified, the first padding applies to the **top and bottom**, the second to the **left and right**.
/// - When **three** values are specified, the first padding applies to the **top**, the second to the **right and left**, the third to the **bottom**.
/// - When **four** values are specified, the paddings apply to the **top**, **right**, **bottom**, and **left** in that order (clockwise).
class EdgeInsetsEditorWidget extends StatefulWidget {
  final EdgeInsets value;
  final void Function(EdgeInsets value) onValueChange;

  final Widget? trailing;

  const EdgeInsetsEditorWidget({
    super.key,
    required this.value,
    required this.onValueChange,
    this.trailing,
  });

  @override
  State<EdgeInsetsEditorWidget> createState() => _EdgeInsetsEditorWidgetState();
}

class _EdgeInsetsEditorWidgetState extends State<EdgeInsetsEditorWidget> {
  final TextEditingController controller = TextEditingController();

  String? error;

  EdgeInsetsFormat get format {
    final value = controller.text.trim().replaceAll(RegExp(r'\s+'), ' ');
    final parts = value.split(' ');

    if (parts.length == 1) {
      return EdgeInsetsFormat.all;
    } else if (parts.length == 2) {
      return EdgeInsetsFormat.vh;
    } else if (parts.length == 3) {
      return EdgeInsetsFormat.thb;
    } else {
      return EdgeInsetsFormat.trbl;
    }
  }

  String serialize(EdgeInsets value) {
    final top = value.top;
    final right = value.right;
    final bottom = value.bottom;
    final left = value.left;

    "all"; // 12, 4
    "vertical horizontal"; // 12 12, 0 12
    "top horizontal bottom"; // 12 0 8, 0 12 4
    "top right bottom left";

    final set = {top, left, right, bottom};

    // Apply to all four sides
    if (set.length == 1) {
      return top.toString();
    }

    // top and bottom | left and right
    if (top == bottom && left == right) {
      return "$top $left";
    }

    // top | left and right | bottom
    if (left == right) {
      return "$top $left $bottom";
    }

    // top | right | bottom | left
    return "$top $right $bottom $left";
  }

  EdgeInsets deserialize(String value) {
    value = value.trim().replaceAll(RegExp(r'\s+'), ' ');
    if (value.isEmpty) return EdgeInsets.zero;

    final parts = value.split(' ');

    if (parts.length == 1) {
      return EdgeInsets.all(
        double.parse(parts[0]),
      );
    }

    if (parts.length == 2) {
      return EdgeInsets.symmetric(
        vertical: double.parse(parts[0]),
        horizontal: double.parse(parts[1]),
      );
    }

    if (parts.length == 3) {
      return EdgeInsets.only(
        top: double.parse(parts[0]),
        right: double.parse(parts[1]),
        bottom: double.parse(parts[2]),
        left: double.parse(parts[1]),
      );
    }

    if (parts.length == 4) {
      return EdgeInsets.only(
        top: double.parse(parts[0]),
        right: double.parse(parts[1]),
        bottom: double.parse(parts[2]),
        left: double.parse(parts[3]),
      );
    }

    return EdgeInsets.zero;
  }

  @override
  void initState() {
    controller.text = serialize(widget.value);

    super.initState();
  }

  @override
  void didUpdateWidget(covariant EdgeInsetsEditorWidget oldWidget) {
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
- When **two** values are specified, the first padding applies to the **top and bottom**, the second to the **left and right**.
- When **three** values are specified, the first padding applies to the **top**, the second to the **right and left**, the third to the **bottom**.
- When **four** values are specified, the paddings apply to the **top**, **right**, **bottom**, and **left** in that order (clockwise).
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
                EdgeInsetsFormat.trbl => "top right bottom left",
                EdgeInsetsFormat.thb => "top horizontal bottom",
                EdgeInsetsFormat.vh => "vertical horizontal",
                EdgeInsetsFormat.all => "all",
              },
        ),
      ),
    );
  }
}
