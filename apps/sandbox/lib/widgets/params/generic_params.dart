import 'package:flutter/material.dart';

class GenericItemData {}

class GenericContainer<T extends GenericItemData> extends StatefulWidget {
  final List<DropdownMenuItem<T>> items;

  const GenericContainer({super.key, required this.items});

  @override
  State<GenericContainer<T>> createState() => _GenericContainerState<T>();
}

class _GenericContainerState<T extends GenericItemData> extends State<GenericContainer<T>> {
  T? selectedItem;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      items: widget.items,
      value: selectedItem,
      onChanged: (value) => setState(() => selectedItem = value),
    );
  }
}
