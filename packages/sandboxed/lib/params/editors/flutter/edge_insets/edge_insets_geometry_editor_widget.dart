import 'package:flutter/material.dart';
import 'package:sandboxed/params/editors/flutter/edge_insets/edge_insets_directional_editor_widget.dart';
import 'package:sandboxed/params/editors/flutter/edge_insets/edge_insets_editor_widget.dart';
import 'package:sandboxed_core/sandboxed_core.dart';

enum EdgeInsetsType {
  classic,
  directional,
}

// TODO(@melvspace): 04/02/25 implement edge insets editor
class EdgeInsetsGeometryEditorWidget<TInsets extends EdgeInsetsGeometry>
    extends StatefulWidget {
  final ParamValue<TInsets> value;

  const EdgeInsetsGeometryEditorWidget({super.key, required this.value});

  @override
  State<EdgeInsetsGeometryEditorWidget<TInsets>> createState() =>
      _EdgeInsetsGeometryEditorWidgetState<TInsets>();
}

class _EdgeInsetsGeometryEditorWidgetState<TInsets extends EdgeInsetsGeometry>
    extends State<EdgeInsetsGeometryEditorWidget<TInsets>> {
  late final controller = TextEditingController();

  EdgeInsetsType get type => switch (widget.value.value) {
        EdgeInsetsDirectional() => EdgeInsetsType.directional,
        _ => EdgeInsetsType.classic,
      };

  T convert<T extends EdgeInsetsGeometry>() {
    final value = widget.value.value;
    if (value is T) return value;

    final leftOrStart = switch (value) {
      EdgeInsets insets => insets.left,
      EdgeInsetsDirectional insets => insets.start,
      _ => throw UnsupportedError(
          "Unsupported source type: ${value.runtimeType}",
        ),
    };

    final top = switch (value) {
      EdgeInsets insets => insets.top,
      EdgeInsetsDirectional insets => insets.top,
      _ => throw UnsupportedError(
          "Unsupported source type: ${value.runtimeType}",
        ),
    };

    final rightOrEnd = switch (value) {
      EdgeInsets insets => insets.right,
      EdgeInsetsDirectional insets => insets.end,
      _ => throw UnsupportedError(
          "Unsupported source type: ${value.runtimeType}",
        ),
    };

    final bottom = switch (value) {
      EdgeInsets insets => insets.bottom,
      EdgeInsetsDirectional insets => insets.bottom,
      _ => throw UnsupportedError(
          "Unsupported source type: ${value.runtimeType}",
        ),
    };

    switch (T) {
      case const (EdgeInsetsGeometry):
      case const (EdgeInsets):
        return EdgeInsets.only(
          left: leftOrStart,
          top: top,
          right: rightOrEnd,
          bottom: bottom,
        ) as T;

      case const (EdgeInsetsDirectional):
        return EdgeInsetsDirectional.only(
          start: leftOrStart,
          top: top,
          end: rightOrEnd,
          bottom: bottom,
        ) as T;
    }

    throw UnsupportedError("Unsupported target type: $T");
  }

  @override
  void initState() {
    controller.text = switch (widget.value.value) {
      EdgeInsetsDirectional insets => insets.start.toString(),
      EdgeInsets insets => insets.left.toString(),
      _ => "0",
    };

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final switcher = TInsets == EdgeInsetsGeometry
        ? DropdownButton(
            value: type,
            isDense: true,
            onChanged: (value) => widget.value.update(
              switch (value) {
                EdgeInsetsType.classic => convert<EdgeInsets>(),
                EdgeInsetsType.directional => convert<EdgeInsetsDirectional>(),
                _ => throw UnsupportedError("Unsupported type: $value"),
              } as TInsets,
            ),
            items: [
              DropdownMenuItem(
                value: EdgeInsetsType.classic,
                child: Text("Classic"),
              ),
              DropdownMenuItem(
                value: EdgeInsetsType.directional,
                child: Text("Directional"),
              ),
            ],
          )
        : null;

    return switch (widget.value.value) {
      EdgeInsets insets => EdgeInsetsEditorWidget(
          value: insets,
          onValueChange: (value) {
            widget.value.update(value as TInsets);
          },
          trailing: switcher,
        ),
      EdgeInsetsDirectional insets => EdgeInsetsDirectionalEditorWidget(
          value: insets,
          onValueChange: (value) {
            widget.value.update(value as TInsets);
          },
          trailing: switcher,
        ),
      _ => Text("Unsupported insets type"),
    };
  }
}
