/// Thrown when a component has generic type parameters that cannot be
/// automatically resolved during code generation.
class UnsupportedGenericParametersException implements Exception {
  /// The map of parameter names to their type strings containing generics.
  final Map<String, String> parameters;

  /// Creates an instance of [UnsupportedGenericParametersException].
  ///
  /// [parameters] is a map of parameter names to their type strings.
  const UnsupportedGenericParametersException(this.parameters);
}
