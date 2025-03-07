import 'package:flutter/material.dart';

class UnsupportedParameters extends StatelessWidget {
  final EdgeInsets padding;
  final TextStyle style;

  const UnsupportedParameters({
    super.key,
    required this.padding,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ColoredBox(
        color: Colors.orange,
        child: Padding(
          padding: padding,
          child: Text(
            'Unsupported example',
            style: style.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
