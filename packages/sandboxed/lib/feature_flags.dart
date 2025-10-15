enum FeatureFlags {
  elementTreeNext(
    title: "Enable 2D tree view",
    description: """
Enables experimental 2D scrolling tree view support for drawer tree.

It works better than the previous one, but has some issues.

Existing issues:
- Clunky expand/collapse transition with expanded nested nodes.
- Exception on collapsing last node - https://github.com/flutter/flutter/issues/164981""",
  );

  final String title;
  final String description;

  const FeatureFlags({required this.title, required this.description});
}
