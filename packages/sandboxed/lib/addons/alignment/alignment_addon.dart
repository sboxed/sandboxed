import 'package:flutter/material.dart';
import 'package:sandboxed/addons/addon.dart';
import 'package:sandboxed/addons/alignment/alignment_picker.dart';
import 'package:sandboxed/addons/mixins/decorator_addon.dart';
import 'package:sandboxed/toolbar/toolbar_addon_mixin.dart';
import 'package:sandboxed/toolbar/toolbar_button.dart';
import 'package:sandboxed/toolbar/toolbar_overlay_button.dart';
import 'package:sandboxed_core/decorator.dart';

final class AlignmentAddon extends Addon
    with DecoratorAddon<Alignment>, ToolbarAddonMixin {
  @override
  String get id => 'alignment';

  @override
  Alignment get initialValue => Alignment.center;

  @override
  List<Decorator> decorate(BuildContext context) {
    return [
      Decorator(
        (context, story) => ListenableBuilder(
          listenable: this,
          builder: (context, child) => Align(
            alignment: value,
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Alignment'),
        const SizedBox(height: 8),
        ListenableBuilder(
          listenable: this,
          builder: (context, child) => AlignmentPicker(
            onChanged: (value) => this.value = value,
            value: value,
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
              listenable: this,
              builder: (context, child) => AlignmentPicker(
                onChanged: (value) => this.value = value,
                value: value,
              ),
            );
          },
          child: const Icon(Icons.align_vertical_center_rounded),
        ),
      ];

  @override
  void decode(covariant Map<String, dynamic> state) {
    value = Alignment(state['x'], state['y']);
  }

  @override
  Map<String, dynamic> encode() {
    return {
      'x': value.x,
      'y': value.y,
    };
  }
}
