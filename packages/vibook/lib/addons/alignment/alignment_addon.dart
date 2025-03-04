import 'package:flutter/material.dart';
import 'package:vibook/addons/addon.dart';
import 'package:vibook/addons/alignment/alignment_picker.dart';
import 'package:vibook/toolbar/toolbar_addon_mixin.dart';
import 'package:vibook/toolbar/toolbar_button.dart';
import 'package:vibook/toolbar/toolbar_overlay_button.dart';
import 'package:vibook_core/decorator.dart';

final class AlignmentAddon extends Addon<Alignment> with ToolbarAddonMixin {
  @override
  String get id => 'alignment';

  @override
  final notifier = ValueNotifier<Alignment>(Alignment.center);

  @override
  List<Decorator> decorate(BuildContext context) {
    return [
      Decorator(
        (context, story) => ListenableBuilder(
          listenable: notifier,
          builder: (context, child) => Align(
            alignment: notifier.value,
            child: child,
          ),
          child: story,
        ),
      ),
    ];
  }

  @override
  Widget buildEditor(BuildContext context) {
    return Column(
      children: [
        const Text('Alignment'),
        const SizedBox(height: 8),
        ListenableBuilder(
          listenable: notifier,
          builder: (context, child) => AlignmentPicker(
            onChanged: (value) => notifier.value = value,
            value: notifier.value,
          ),
        ),
      ],
    );
  }

  @override
  List<Widget> get actions => [
        ToolbarOverlayButton(
          tooltip: const ToolbarTooltip(message: 'Alignment'),
          overlay: (context) {
            return ListenableBuilder(
              listenable: notifier,
              builder: (context, child) => AlignmentPicker(
                onChanged: (value) => notifier.value = value,
                value: notifier.value,
              ),
            );
          },
          child: const Icon(Icons.align_vertical_center_rounded),
        ),
      ];

  @override
  void deserialize(Map<String, dynamic> json) {
    notifier.value = Alignment(json['x'], json['y']);
  }

  @override
  Map<String, dynamic> serialize() {
    return {
      'x': notifier.value.x,
      'y': notifier.value.y,
    };
  }
}
