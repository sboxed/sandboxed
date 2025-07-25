import 'package:flutter/material.dart';

abstract class AbstractWidget extends StatelessWidget {
  final String name;

  const AbstractWidget({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Text("Hello $name");
  }
}

class ImplementerWidget extends AbstractWidget {
  const ImplementerWidget({super.key, required super.name});
}
