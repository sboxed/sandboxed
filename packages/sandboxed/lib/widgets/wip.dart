import 'dart:ui';

import 'package:flutter/material.dart';

class WIP extends StatelessWidget {
  final Widget child;

  const WIP({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Positioned.fill(
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Theme.of(context) //
                      .colorScheme
                      .onPrimary
                      .withOpacity(.2),
                  border: Border.all(
                    width: 3,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                child: Center(
                  child: Text(
                    "Work in progress",
                    style: TextStyle(
                      color: switch (Theme.of(context).brightness) {
                        Brightness.dark => Colors.white,
                        Brightness.light => Colors.black,
                      },
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
