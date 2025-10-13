import 'package:flutter/material.dart';
import 'package:sandboxed/params/editors/flutter/edge_insets/edge_insets_geometry_editor_widget.dart';
import 'package:sandboxed_core/sandboxed_core.dart';

class EdgeInsetsParamEditorPresenter<TInsets extends EdgeInsetsGeometry>
    extends ValueEditorPresenter<TInsets> {
  final ParamEditor<TInsets> editor;

  const EdgeInsetsParamEditorPresenter(this.editor);

  @override
  Widget build(BuildContext context, ParamValue<TInsets> value) {
    return EdgeInsetsGeometryEditorWidget(value: value);
  }
}
