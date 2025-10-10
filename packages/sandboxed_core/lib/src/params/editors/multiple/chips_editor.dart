import 'package:sandboxed_core/sandboxed_core.dart';

class MultiChipsEditor<TItem> extends ParamEditor<List<TItem>>
    with ListParamEditor<TItem> {
  final LabelBuilder<TItem> label;
  final List<TItem> values;

  const MultiChipsEditor({
    required this.label,
    required this.values,
  });
}
