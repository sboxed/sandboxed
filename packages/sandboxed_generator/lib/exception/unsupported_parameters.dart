class UnsupportedParametersException implements Exception {
  /// name to type dictionary
  final Map<String, String> parameters;

  const UnsupportedParametersException(this.parameters);
}

class UnsupportedParameterException implements Exception {
  final String type;

  const UnsupportedParameterException(this.type);
}
