class DocsCleaner {
  String clean(String doc) {
    doc = doc.replaceAll(RegExp(r'^///\s?'), '');
    doc = convertSnippets(doc);

    return doc;
  }

  String convertSnippets(String doc) {
    bool started = false;
    String result = '';
    for (var line in doc.split('\n')) {
      if (line.contains('{@tool snippet}')) {
        if (line.contains('{@end-tool}')) {
          line = line
              .replaceAll('{@tool snippet}', '')
              .replaceAll('{@end-tool}', '');
          if (line.trim().isEmpty) continue;
        } else {
          started = true;
          line = line.replaceAll('{@tool snippet}', '');
          if (line.trim().isEmpty) continue;
        }
      } else if (line.contains('{@end-tool}') && started) {
        started = false;
        line = line.replaceAll('{@end-tool}', '');
        if (line.trim().isEmpty) continue;
      }

      result += '$line\n';
    }

    return result;
  }
}
