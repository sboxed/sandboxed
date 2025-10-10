import 'package:sandboxed_core/sandboxed_core.dart';
import 'package:sandboxed_core/src/params/param_editor.dart';

class IntegerSliderEditor extends ParamEditor<int> {
  final int min;
  final int max;
  final int step;

  const IntegerSliderEditor({
    required this.min,
    required this.max,
    required this.step,
  })  : assert(max > min, "maxValue must be greater than minValue"),
        assert(step > 0, "step must be greater than 0");
}
