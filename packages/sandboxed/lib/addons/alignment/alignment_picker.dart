import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class AlignmentPicker extends StatelessWidget {
  const AlignmentPicker({
    super.key,
    required this.onChanged,
    required this.value,
  });

  static final alignments = {
    Alignment.topLeft: 'Top Left',
    Alignment.topCenter: 'Top Center',
    Alignment.topRight: 'Top Right',
    Alignment.centerLeft: 'Center Left',
    Alignment.center: 'Center',
    Alignment.centerRight: 'Center Right',
    Alignment.bottomLeft: 'Bottom Left',
    Alignment.bottomCenter: 'Bottom Center',
    Alignment.bottomRight: 'Bottom Right',
  };

  static final table = alignments.entries.slices(3);

  final Alignment value;
  final ValueChanged<Alignment> onChanged;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(3),
      ),
      child: Padding(
        padding: const EdgeInsets.all(1),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (final row in table)
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (final alignment in row)
                    Builder(
                      builder: (context) {
                        final isSelected = alignment.key == value;

                        return Tooltip(
                          message: alignment.value,
                          waitDuration: const Duration(milliseconds: 500),
                          preferBelow: false,
                          verticalOffset: 16,
                          child: SizedBox.square(
                            dimension: 24,
                            child: Padding(
                              padding: const EdgeInsets.all(.5),
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? Theme.of(context)
                                          .colorScheme
                                          .primaryFixedDim
                                      : Theme.of(context)
                                          .colorScheme
                                          .secondaryContainer,
                                  borderRadius: BorderRadius.circular(3),
                                  border: Border.all(
                                    color: isSelected
                                        ? Theme.of(context)
                                            .colorScheme
                                            .secondaryContainer
                                        : Colors.transparent,
                                    width: isSelected ? 1 : 0,
                                  ),
                                ),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () => onChanged(alignment.key),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
