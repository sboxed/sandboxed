import 'package:sandboxed/params/editors/dart/date_time_editor_widget.dart';
import 'package:sandboxed/params/editors/dart/duration_editor_widget.dart';
import 'package:sandboxed/params/editors/editors.dart';
import 'package:sandboxed_core/sandboxed_core.dart';

class DefaultParamEditorFactory
    extends ParamEditorFactory<ValueEditorPresenter<dynamic>?> {
  const DefaultParamEditorFactory();

  @override
  ValueEditorPresenter<T>? create<T>(ParamEditor<T> e) {
    switch (e) {
      case StringEditor editor:
        return StringEditorPresenter(editor) as ValueEditorPresenter<T>;

      case IntegerEditor editor:
        return IntegerEditorPresenter(editor) as ValueEditorPresenter<T>;

      case IntegerSliderEditor editor:
        return IntegerSliderEditorPresenter(editor) as ValueEditorPresenter<T>;

      case DoubleEditor editor:
        return DoubleEditorPresenter(editor) as ValueEditorPresenter<T>;

      case DoubleSliderEditor editor:
        return DoubleSliderEditorPresenter(editor) as ValueEditorPresenter<T>;

      case BooleanEditor editor:
        return BooleanEditorPresenter(editor) as ValueEditorPresenter<T>;

      case SingleChipsEditor<T> editor:
        return SingleChipsEditorPresenter(editor);

      case SingleSegmentedEditor<T> editor:
        return SingleSegmentedEditorPresenter(editor);

      case ReadonlyEditor<T> editor:
        return ReadonlyEditorPresenter<T>(editor);

      case JsonEditor<T> editor:
        return JsonEditorPresenter(editor);

      case DateTimeEditor editor:
        return DateTimeEditorPresenter(editor) as ValueEditorPresenter<T>;

      case DurationEditor editor:
        return DurationEditorPresenter(editor) as ValueEditorPresenter<T>;

      default:
        return null;
    }
  }

  @override
  ValueEditorPresenter<dynamic>? createListEditor<TItem>(
    ListParamEditor<TItem> e,
  ) {
    switch (e) {
      case MultiChipsEditor<TItem> editor:
        return MultiChipsEditorPresenter<TItem>(editor);

      case MultiSegmentedEditor<TItem> editor:
        return MultiSegmentedEditorPresenter<TItem>(editor);

      default:
        return null;
    }
  }
}
