import 'package:flutter/material.dart';
import 'package:sandboxed/widgets/internal/utility/skip_frame.dart';
import 'package:sandboxed_core/sandboxed_core.dart';

class DoubleSliderEditorPresenter extends ValueEditorPresenter<double> {
  final DoubleSliderEditor editor;

  const DoubleSliderEditorPresenter(this.editor);

  @override
  Widget build(BuildContext context, ParamValue<double> value) {
    return DoubleSliderEditorWidget(
      min: editor.min,
      max: editor.max,
      step: editor.step,
      value: value,
    );
  }
}

class DoubleSliderEditorWidget extends StatelessWidget {
  final ParamValue<double> value;

  final double min;
  final double max;
  final double step;

  const DoubleSliderEditorWidget({
    super.key,
    required this.value,
    this.min = 0.0,
    this.max = 1.0,
    this.step = 0.1,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(value.value?.toStringAsFixed(2) ?? '0.0'),
        ),
        Flexible(
          // TODO(@melvspace): 10/11/25 for some reason resizable container breaks overlay portals which are used in slider widget
          child: SkipFrame(
            child: Slider(
              // ignore: deprecated_member_use
              year2023: false,
              label: value.value?.toStringAsFixed(2),
              padding: EdgeInsets.only(right: 16),
              value: (value.value ?? 0),
              min: min,
              max: max,
              divisions: (max - min) ~/ step,
              onChanged: (value) => this.value.update(value),
            ),
          ),
        ),
      ],
    );
  }
}

class IntegerSliderEditorPresenter extends ValueEditorPresenter<int> {
  final IntegerSliderEditor editor;

  const IntegerSliderEditorPresenter(this.editor);

  @override
  Widget build(BuildContext context, ParamValue<int> value) {
    return IntegerSliderEditorWidget(
      min: editor.min,
      max: editor.max,
      step: editor.step,
      value: value,
    );
  }
}

class IntegerSliderEditorWidget extends StatelessWidget {
  final ParamValue<int> value;

  final int min;
  final int max;
  final int step;

  const IntegerSliderEditorWidget({
    super.key,
    required this.value,
    this.min = 0,
    this.max = 100,
    this.step = 1,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: value,
      builder: (context, child) {
        return Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(value.value.toString()),
            ),
            Flexible(
              // TODO(@melvspace): 10/11/25 for some reason resizable container breaks overlay portals which are used in slider widget
              child: SkipFrame(
                child: Slider(
                  // ignore: deprecated_member_use
                  year2023: false,
                  label: value.value.toString(),
                  padding: EdgeInsets.only(right: 16),
                  value: (value.value ?? 0).toDouble(),
                  min: min.toDouble(),
                  max: max.toDouble(),
                  divisions: (max - min) ~/ step,
                  onChanged: (value) => this.value.update(value.toInt()),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
