import 'package:flutter/widgets.dart';
import 'package:sandboxed/params/editors/flutter/alignment_param_builder.dart';
import 'package:sandboxed/params/editors/flutter/color_value_editor_widget.dart';
import 'package:sandboxed/params/editors/flutter/edge_insets/edge_insets_param_editor_presenter.dart';
import 'package:sandboxed/params/editors/flutter/gradient_editor_widget.dart';
import 'package:sandboxed/params/editors/flutter/text_style_editor_widget.dart';
import 'package:sandboxed_core/sandboxed_core.dart';

class FlutterParamEditorFactory
    extends ParamEditorFactory<ValueEditorPresenter<dynamic>?> {
  const FlutterParamEditorFactory();

  @override
  ValueEditorPresenter<T>? create<T>(ParamEditor<T> e) {
    switch (e) {
      case ParamEditor<Alignment> editor:
        return AlignmentParamEditorPresenter(editor) as ValueEditorPresenter<T>;

      case ParamEditor<AlignmentDirectional> editor:
        return AlignmentParamEditorPresenter(editor) as ValueEditorPresenter<T>;

      case ParamEditor<EdgeInsets> editor:
        return EdgeInsetsParamEditorPresenter(editor)
            as ValueEditorPresenter<T>;

      case ParamEditor<EdgeInsetsDirectional> editor:
        return EdgeInsetsParamEditorPresenter(editor)
            as ValueEditorPresenter<T>;

      case ParamEditor<EdgeInsetsGeometry> editor:
        return EdgeInsetsParamEditorPresenter(editor)
            as ValueEditorPresenter<T>;

      case ParamEditor<TextStyle> editor:
        return TextStyleEditorPresenter(editor) as ValueEditorPresenter<T>;

      case ParamEditor<Color> editor:
        return ColorEditorPresenter(editor) as ValueEditorPresenter<T>;

      case ParamEditor<Gradient> editor:
        return GradientEditorPresenter(editor) as ValueEditorPresenter<T>;

      default:
        return null;
    }
  }
}
