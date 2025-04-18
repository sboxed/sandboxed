import 'package:flutter/material.dart';
import 'package:sandboxed/addons/addon.dart';
import 'package:sandboxed/addons/mixins/decorator_addon.dart';

abstract base class FlagAddon extends Addon with DecoratorAddon<bool> {
  String get name;

  final bool enabled;

  FlagAddon({this.enabled = false});

  @override
  bool get initialValue => enabled;

  @override
  Widget buildEditor(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name),
        const SizedBox(height: 8),
        ListenableBuilder(
          listenable: this,
          builder: (context, child) => Switch(
            value: value,
            onChanged: (value) => this.value = value,
          ),
        ),
      ],
    );
  }

  @override
  void decode(covariant bool state) {
    value = state;
  }

  @override
  bool encode() {
    return value;
  }
}
