import 'package:flutter/material.dart';
import 'package:vibook_sandbox/data/some_enum.dart';

class WithEnum extends StatelessWidget {
  final SomeEnum enumValue;

  const WithEnum({
    super.key,
    required this.enumValue,
  });

  @override
  Widget build(BuildContext context) {
    return Text(enumValue.toString());
  }
}
