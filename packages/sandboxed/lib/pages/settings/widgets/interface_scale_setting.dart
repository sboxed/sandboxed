import 'package:flutter/material.dart';

class InterfaceScaleSetting extends StatefulWidget {
  final double value;
  final ValueChanged<double> onChanged;

  const InterfaceScaleSetting({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  State<InterfaceScaleSetting> createState() => _InterfaceScaleSettingState();
}

class _InterfaceScaleSettingState extends State<InterfaceScaleSetting> {
  double? changing;

  double normalize(double value) {
    print([
      value,
      value * 100,
      (value * 100).round(),
      (value * 100).round() / 100,
      (((value * 100).round() / 100) * 100).round()
    ]);
    return (value * 100).round() / 100;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IntrinsicWidth(
          child: ListTile(
            title: Text("UI Scale"),
          ),
        ),
        Flexible(
          child: Slider(
            min: 0.2,
            max: 4.0,
            value: changing ?? widget.value,
            label: "${(normalize(changing ?? widget.value) * 100).round()}%",
            divisions: (400 - 20) ~/ 10,
            onChanged: (nextValue) {
              setState(() => changing = nextValue);
            },
            onChangeEnd: (value) {
              widget.onChanged(normalize(value));
              setState(() => changing = null);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "${(normalize(changing ?? widget.value) * 100).round()}%",
          ),
        )
      ],
    );
  }
}
