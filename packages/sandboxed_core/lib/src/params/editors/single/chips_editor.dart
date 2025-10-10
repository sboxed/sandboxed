import 'package:sandboxed_core/sandboxed_core.dart';

class SingleChipsEditor<T> extends ParamEditor<T> {
  final LabelBuilder<T> label;
  final List<T> values;

  const SingleChipsEditor({
    required this.label,
    required this.values,
  });
}
