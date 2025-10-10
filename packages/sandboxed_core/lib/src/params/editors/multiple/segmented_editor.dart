import 'package:sandboxed_core/sandboxed_core.dart';

class MultiSegmentedEditor<TItem> extends ParamEditor<List<TItem>>
    with ListParamEditor<TItem> {
  final LabelBuilder<TItem> label;
  final List<TItem> values;

  const MultiSegmentedEditor({
    required this.label,
    required this.values,
  });
}
