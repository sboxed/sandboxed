import 'package:flutter/material.dart';

class SBThemeButton extends StatelessWidget {
  final ThemeMode value;
  final VoidCallback onPressed;

  const SBThemeButton({
    super.key,
    required this.value,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: Colors.white,
      onPressed: onPressed,
      icon: AnimatedSwitcher(
        duration: const Duration(milliseconds: 160),
        child: KeyedSubtree(
          key: ValueKey(value),
          child: switch (value) {
            ThemeMode.dark => const Icon(Icons.dark_mode),
            ThemeMode.light => const Icon(Icons.light_mode),
            ThemeMode.system => const Icon(Icons.brightness_auto),
          },
        ),
      ),
    );
  }
}
