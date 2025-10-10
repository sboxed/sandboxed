import 'package:sandboxed_core/sandboxed_core.dart';
import 'package:sandboxed_core/src/params/param_serializer.dart';

extension MultiParamsX on ParamStorage {
  ParamBuilder<List<T>> multi<T>(
    String id,
    List<T> values, {
    LabelBuilder<T> label = defaultLabelBuilder,
  }) {
    return ParamBuilder<List<T>>(id)
        .store(this)
        .constrain(
          (newValue) => newValue.every(
            (element) => values.contains(element),
          ),
        )
        .withDefault([]) //
        .serializable(ParamSerializer(
          serialize: (value) => value
              .map((it) => it is Enum ? it.name : values.indexOf(it))
              .toList(),
          deserialize: (json) {
            final list = json as List;
            if (values.first is Enum) {
              return values
                  .where((it) => list.contains((it as Enum).name))
                  .toList();
            } else {
              return [
                for (final it in list)
                  if (it is int) values[it]
              ];
            }
          },
        ))
        .editor(MultiChipsEditor(label: label, values: values));
  }
}

extension ExtraMultiEditorsX<T> on ParamBuilder<List<T>> {
  ParamBuilder<List<T>> segmented({
    LabelBuilder<T> label = defaultLabelBuilder,
    List<T>? values,
  }) {
    if (values == null) {
      // TODO(@melvspace): 10/11/25 generalize editor factory for multiple param editors
      if (readEditor() case MultiChipsEditor<T> editor) {
        values = editor.values;
      } else {
        throw ArgumentError.notNull('values');
      }
    }

    return editor(MultiSegmentedEditor(label: label, values: values))
        .withDefault([values.first]);
  }
}
