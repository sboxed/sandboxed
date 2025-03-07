import 'package:flutter/widgets.dart';
import 'package:recase/recase.dart';
import 'package:vibook/addons/typed_addons/flag_addon.dart';
import 'package:vibook_core/decorator.dart';

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
