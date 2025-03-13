import 'package:flutter/material.dart';

typedef ScrollControllerBuilderCallback = Widget Function(
    BuildContext context, ScrollController controller);

class ScrollControllerBuilder extends StatefulWidget {
  final ScrollControllerBuilderCallback builder;

  const ScrollControllerBuilder({
    super.key,
    required this.builder,
  });

  @override
  State<ScrollControllerBuilder> createState() =>
      _ScrollControllerBuilderState();
}

class _ScrollControllerBuilderState extends State<ScrollControllerBuilder> {
  final ScrollController controller = ScrollController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, controller);
  }
}
