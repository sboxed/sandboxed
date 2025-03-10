import 'package:flutter/material.dart';
import 'package:vibook/addons/addon.dart';
import 'package:vibook/addons/mixins/decorator_addon.dart';

abstract base class FlagAddon extends Addon with DecoratorAddon<bool> {
  String get name;

  final bool enabled;

  FlagAddon({this.enabled = false});

  @override
  late final notifier = ValueNotifier<bool>(enabled);

  bool get value => notifier.value;

  @override
  Widget buildEditor(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name),
        const SizedBox(height: 8),
        ListenableBuilder(
          listenable: notifier,
          builder: (context, child) => Switch(
            value: value,
            onChanged: (value) => notifier.value = value,
          ),
        ),
      ],
    );
  }

  @override
  void deserialize(covariant bool json) {
    notifier.value = json;
  }

  @override
  bool serialize() {
    return notifier.value;
  }
}
