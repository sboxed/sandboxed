import 'package:sandboxed_core/sandboxed_core.dart';

/// Exception thrown when [ParamWrapper] cannot be resolved to a valid parameter
/// type.
class UnsupportedParamException implements Exception {
  /// The parameter that could not be resolved.
  final ParamWrapper param;

  /// Creates an instance of [UnsupportedParamException].
  ///
  /// [param] is the parameter that could not be resolved.
  const UnsupportedParamException(this.param);
}
