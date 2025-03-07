class UnsupportedParametersMessage {
  final Map<String, String> parameters;

  UnsupportedParametersMessage({required this.parameters});

  String build() {
    return '''
DefaultTextStyle(
  style: TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.red,
    fontSize: 24,
  ),
  child: Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Component has unsupported parameters and can\\'t be built automatically'),
          ${parameters.entries.map((e) => "Text('Parameter `${e.key}` of type [${e.value}]')").join(',')},
        ],
      ),
    ),
  ),
)
''';
  }
}
