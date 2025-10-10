class ParamShareable<T> {
  final String Function(T value) share;
  final T Function(String value) restore;

  const ParamShareable({
    required this.share,
    required this.restore,
  });
}
