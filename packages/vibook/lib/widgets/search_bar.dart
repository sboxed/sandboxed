import 'package:flutter/material.dart';
import 'package:vibook/widgets/wip.dart';

class ViSearchBar extends StatelessWidget {
  const ViSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const WIP(
      child: TextField(
        decoration: InputDecoration(label: Text('Search')),
      ),
    );
  }
}
