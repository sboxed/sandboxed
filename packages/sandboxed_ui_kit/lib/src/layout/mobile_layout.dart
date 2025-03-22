import 'package:flutter/material.dart';

class MobileLayout extends StatefulWidget {
  final Widget drawer;
  final Widget viewport;

  const MobileLayout({
    super.key,
    required this.drawer,
    required this.viewport,
  });

  @override
  State<MobileLayout> createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: widget.drawer,
      body: widget.viewport,
    );
  }
}
