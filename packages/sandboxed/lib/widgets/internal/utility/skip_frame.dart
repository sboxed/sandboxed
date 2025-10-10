import 'package:flutter/material.dart';

class SkipFrame extends StatefulWidget {
  final Widget child;

  const SkipFrame({
    super.key,
    required this.child,
  });

  @override
  State<SkipFrame> createState() => _SkipFrameState();
}

class _SkipFrameState extends State<SkipFrame> {
  bool ready = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        setState(() => ready = true);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!ready) return const SizedBox();

    return widget.child;
  }
}
