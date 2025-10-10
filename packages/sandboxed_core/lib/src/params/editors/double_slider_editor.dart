import 'package:sandboxed_core/sandboxed_core.dart';
import 'package:sandboxed_core/src/params/param_editor.dart';

class DoubleSliderEditor extends ParamEditor<double> {
  final double min;
  final double max;
  final double step;

  const DoubleSliderEditor({
    required this.min,
    required this.max,
    required this.step,
  })  : assert(max > min, "maxValue must be greater than minValue"),
        assert(step > 0, "step must be greater than 0");
}
