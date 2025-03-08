import 'package:vibook_core/param.dart';

base class ListParamType {}

class SingleParam<T> extends Param<T> {
  final List<T> values;

  SingleParam(
    super.value,
    this.values, [
    ListParamType? super.type,
  ]);
}

class MultiParam<T> extends Param<List<T>> {
  final List<T> values;

  MultiParam(
    super.value,
    this.values, [
    ListParamType? super.type,
  ]);
}

class MultiParamNullable<T> extends Param<List<T>?> {
  final List<T>? values;

  MultiParamNullable(
    super.value,
    this.values, [
    ListParamType? super.type,
  ]);
}
