import 'package:sandboxed_core/src/params/params_store.dart';

class UseParams<T> {
  final T Function(Params params) builder;

  UseParams(this.builder);
}
