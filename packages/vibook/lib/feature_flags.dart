enum FeatureFlags {
  /// Experimental 2D scrolling tree view support for drawer tree.
  ///
  /// Existing issues:
  /// - Clunky expand/collapse transition with expanded nested nodes.
  /// - Exception on collapsing last node - https://github.com/flutter/flutter/issues/164981
  elementTreeNext;
}
