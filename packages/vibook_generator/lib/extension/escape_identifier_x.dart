extension EscapeIdentifierX on String {
  String get escaped {
    return replaceAll(r'$', r'\$');
  }
}
