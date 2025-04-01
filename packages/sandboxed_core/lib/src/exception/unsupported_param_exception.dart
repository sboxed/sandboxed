import 'package:sandboxed_core/sandboxed_core.dart';

class UnsupportedParamException {
  final ParamWrapper param;

  const UnsupportedParamException(this.param);
}
