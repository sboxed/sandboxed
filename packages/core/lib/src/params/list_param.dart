import 'package:vibook_core/src/params/param_wrapper.dart';

class SingleChoiceParamWrapper<T> extends ParamWrapper<T> {
  final List<T> values;

  SingleChoiceParamWrapper({required this.values});
}

class MultiChoiceParamWrapper<T> extends ParamWrapper<List<T>> {
  final List<T> values;

  MultiChoiceParamWrapper({required this.values});
}
