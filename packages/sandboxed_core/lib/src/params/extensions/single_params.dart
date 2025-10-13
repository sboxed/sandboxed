import 'package:sandboxed_core/sandboxed_core.dart';
import 'package:sandboxed_core/src/params/param_serializer.dart';

extension SingleParamsX on ParamStorage {
  ParamBuilder<T> single<T>(
    String id,
    List<T> values, {
    LabelBuilder<T> label = defaultLabelBuilder,
  }) {
    return ParamBuilder<T>(id)
        .store(this)
        .withDefault(values.first)
        .constrain((newValue) => values.contains(newValue))
        .serializable(ParamSerializer(
          serialize: (value) {
            if (value == null) return null;

            return value is Enum //
                ? value.name
                : values.indexOf(value);
          },
          deserialize: (value) {
            if (values.first is Enum) {
              return values.where((it) => value == (it as Enum).name).first;
            } else {
              return values[value];
            }
          },
        ))
        .editor(SingleChipsEditor(label: label, values: values));
  }
}

extension ExtraSingleEditorsX<T> on ParamBuilder<T> {
  ParamBuilder<T> segmented({
    LabelBuilder<T> label = defaultLabelBuilder,
    List<T>? values,
  }) {
    if (values == null) {
      // TODO(@melvspace): 10/11/25 generalize editor factory for single param editors
      if (readEditor() case SingleChipsEditor<T> editor) {
        values = editor.values;
      } else {
        throw ArgumentError.notNull('values');
      }
    }

    return editor(SingleSegmentedEditor(label: label, values: values));
  }
}
