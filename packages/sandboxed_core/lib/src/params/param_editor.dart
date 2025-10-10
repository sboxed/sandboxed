import 'package:sandboxed_core/src/params/param_editor_factory.dart';

class ParamEditor<T> {
  const ParamEditor();

  R accept<R>(ParamEditorFactory<R> v) {
    return v.create(this);
  }
}

mixin class ListParamEditor<TItem> implements ParamEditor<List<TItem>> {
  @override
  R accept<R>(ParamEditorFactory<R> v) {
    return v.createListEditor(this);
  }
}
