import 'package:flutter/widgets.dart';
import 'package:sandboxed/addons/typed_addons/flag_addon.dart';
import 'package:sandboxed_core/decorator.dart';

/// Capitalize the first letter of a word and lowercase the rest
String _capitalize(String word) {
  if (word.isEmpty) return '';
  return word[0].toUpperCase() + word.substring(1).toLowerCase();
}

extension _StringTitleCase on String {
  String get titleCase {
    if (isEmpty) return this;
    return split(RegExp(r'[\s_-]+'))
        .map(_capitalize)
        .join(' ');
  }
}

final class DelegateDecoratorAddon extends FlagAddon {
  @override
  final String id;

  final List<Decorator> decorators;

  @override
  String get name => id.titleCase;

  DelegateDecoratorAddon({
    required this.id,
    required this.decorators,
    super.enabled = true,
  });

  @override
  List<Decorator> decorate(BuildContext context) {
    return decorators;
  }
}
