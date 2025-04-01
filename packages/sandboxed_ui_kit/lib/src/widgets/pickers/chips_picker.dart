import 'package:flutter/material.dart';

class ChipsPicker<T> extends StatelessWidget {
  final T value;
  final List<(T, String)> values;
  final ValueChanged<T> onSelected;

  const ChipsPicker({
    super.key,
    required this.value,
    required this.values,
    required this.onSelected,
  });

  static ChipsPicker enum$<T extends Enum>({
    required T value,
    required List<T> values,
    required ValueChanged<T> onSelected,
  }) {
    return ChipsPicker<T>(
      onSelected: onSelected,
      value: value,
      values: [
        for (final value in values) //
          (value, value.name),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        for (final choice in values)
          ChoiceChip(
            selected: choice.$1 == value,
            label: Text(choice.$2),
            onSelected: (selected) {
              if (selected) {
                onSelected.call(choice.$1);
              }
            },
          )
      ],
    );
  }
}

class MultiChipsPicker<T> extends StatelessWidget {
  final Set<T> selected;
  final List<(T, String)> values;
  final ValueChanged<T> onSelected;
  final ValueChanged<T> onDeselected;

  const MultiChipsPicker({
    super.key,
    required this.selected,
    required this.values,
    required this.onSelected,
    required this.onDeselected,
  });

  static MultiChipsPicker enum$<T extends Enum>({
    required Set<T> selected,
    required List<T> values,
    required ValueChanged<T> onSelected,
    required ValueChanged<T> onDeselected,
  }) {
    return MultiChipsPicker<T>(
      selected: selected,
      onSelected: onSelected,
      onDeselected: onDeselected,
      values: [
        for (final value in values) //
          (value, value.name),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        for (final choice in values)
          ChoiceChip(
            selected: selected.contains(choice.$1),
            label: Text(choice.$2),
            onSelected: (selected) {
              if (selected) {
                onSelected.call(choice.$1);
              } else {
                onDeselected.call(choice.$1);
              }
            },
          )
      ],
    );
  }
}
