import 'package:flutter/material.dart';
import 'package:vibook/addons/addon.dart';

abstract base class FlagAddon extends Addon<bool> {
  String get name;

  @override
  final notifier = ValueNotifier<bool>(false);

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
  void deserialize(Map<String, dynamic> json) {
    notifier.value = json['value'];
  }

  @override
  Map<String, dynamic> serialize() {
    return {'value': notifier.value};
  }
}
