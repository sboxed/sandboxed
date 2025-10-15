import 'package:flutter/material.dart';

class UnsupportedParameters extends StatelessWidget {
  final TextStyle style;

  const UnsupportedParameters({super.key, required this.style});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.secondaryFixed,
          ),
        ),
        child: Text(
          'Unsupported example',
          style: style.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
