import 'package:sandboxed_core/sandboxed_core.dart';

/// Exception thrown when [ParamValue] cannot be resolved to a valid parameter
/// type.
class UnsupportedParamException implements Exception {
  final String id;

  /// The parameter that could not be resolved.
  final ParamValue param;

  /// Creates an instance of [UnsupportedParamException].
  ///
  /// [param] is the parameter that could not be resolved.
  const UnsupportedParamException(this.id, this.param);
}
