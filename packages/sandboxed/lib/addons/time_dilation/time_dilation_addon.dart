import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:sandboxed/addons/addon.dart';
import 'package:sandboxed/addons/mixins/decorator_addon.dart';
import 'package:sandboxed/toolbar/toolbar_addon_mixin.dart';
import 'package:sandboxed/toolbar/toolbar_button.dart';
import 'package:sandboxed/toolbar/toolbar_overlay_button.dart';

/// An addon that allows controlling the time dilation (animation speed) of the application.
///
/// This addon provides a slider to adjust the animation speed, affecting the perceived
/// time progression in the app. It uses Flutter's [timeDilation] to modify animation rates.
final class TimeDilationAddon extends Addon
    with DecoratorAddon<double>, ToolbarAddonMixin {
  @override
  String get id => "time_dilation";

  @override
  double get initialValue => timeDilation;

  @override
  Widget buildEditor(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Animation Speed'),
        const SizedBox(height: 8),
        ListenableBuilder(
          listenable: this,
          builder: (context, child) => SliderTheme(
            data: Theme.of(context).sliderTheme.copyWith(
                  // ignore: deprecated_member_use
                  showValueIndicator: ShowValueIndicator.always,
                ),
            child: Row(
              spacing: 12,
              children: [
                Text('${(value).toStringAsFixed(1)}x'),
                Flexible(
                  child: Slider(
                    label: '${value.toStringAsFixed(1)}x',
                    value: value,
                    min: .1,
                    max: 4,
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    onChangeStart: (value) => timeDilation = 1,
                    onChanged: (double value) => this.value = value,
                    onChangeEnd: (value) => timeDilation = 1 / value,
                  ),
                ),
                AnimatedOpacity(
                  opacity: value != 1 ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 160),
                  child: IgnorePointer(
                    ignoring: value == 1,
                    child: IconButton(
                      onPressed: () => timeDilation = value = 1,
                      icon: Icon(Icons.replay_outlined),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  List<Widget> get actions {
    return [
      ListenableBuilder(
        listenable: this,
        builder: (context, child) {
          return ToolbarOverlayButton(
            selected: value != 1,
            tooltip: ToolbarTooltip(message: 'Animation Speed'),
            overlay: (BuildContext context) {
              return buildEditor(context);
            },
            child: Icon(Icons.speed),
          );
        },
      ),
    ];
  }
}
