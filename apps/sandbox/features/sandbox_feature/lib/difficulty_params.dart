import 'package:sandboxed_core/sandboxed_core.dart';

enum Difficulty { easy, medium, hard }

extension DifficultyParamsX on ParamStorage {
  ParamBuilder<Difficulty> difficulty(String id) {
    return ParamBuilder<Difficulty>(id) //
        .store(this)
        .editor(
          EnumDropdownEditor<Difficulty>(
            labelBuilder: defaultLabelBuilder,
            values: Difficulty.values,
          ),
        );
  }
}

class EnumDropdownEditor<T> extends ParamEditor<T> {
  final LabelBuilder<T> labelBuilder;
  final List<T> values;

  const EnumDropdownEditor({
    required this.labelBuilder,
    required this.values,
  });
}
