import 'package:flutter/material.dart';

class NullableAndRequiredParamsWidget extends StatelessWidget {
  final String? text;
  final bool? boolean;
  final double? double$;
  final int? integer;

  final String requiredText;
  final bool requiredBoolean;
  final double requiredDouble;
  final int requiredInteger;

  const NullableAndRequiredParamsWidget({
    super.key,
    this.text,
    this.boolean,
    this.double$,
    this.integer,
    required this.requiredText,
    required this.requiredBoolean,
    required this.requiredDouble,
    required this.requiredInteger,
  });

  Widget cell({Widget? child}) {
    return TableCell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final data = {
      'text': text,
      'boolean': boolean,
      r'double$': double$,
      'integer': integer,
      'requiredText': requiredText,
      'requiredBoolean': requiredBoolean,
      r'requiredDouble$': requiredDouble,
      'requiredInteger': requiredInteger,
    };

    return Table(
      defaultColumnWidth: const IntrinsicColumnWidth(),
      children: [
        TableRow(
          children: [
            cell(child: const Text('Parameter')),
            cell(child: const Text('Null Status')),
            cell(child: const Text('Value')),
          ],
        ),
        for (final item in data.entries)
          TableRow(
            children: [
              cell(
                child: Text(item.key),
              ),
              cell(
                child: Text(item.value == null ? 'is null' : 'is not null'),
              ),
              cell(
                child: Text(
                  item.value.toString(),
                ),
              ),
            ],
          )
      ],
    );
  }
}
