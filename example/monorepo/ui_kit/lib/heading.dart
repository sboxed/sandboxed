import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  const Heading({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Heading",
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}
