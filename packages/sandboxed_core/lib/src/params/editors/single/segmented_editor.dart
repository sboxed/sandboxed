import 'package:sandboxed_core/sandboxed_core.dart';

class SingleSegmentedEditor<T> extends ParamEditor<T> {
  final LabelBuilder<T> label;
  final List<T> values;

  const SingleSegmentedEditor({
    required this.label,
    required this.values,
  });
}
