import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vibook/provider/brand_color.dart';
import 'package:vibook/provider/theme_mode.dart';
import 'package:vibook/tree/component_tree.dart';

class ViDrawer extends StatelessWidget {
  const ViDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return Drawer(
          child: Column(
            children: [
              Consumer(
                builder: (context, ref, child) => ListTile(
                  tileColor: ref.watch(brandColorProvider),
                  title: FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.topLeft,
                    child: Text(
                      'VIBOOK',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                    ),
                  ),
                  contentPadding: const EdgeInsets.only(left: 16, right: 8),
                  trailing: Consumer(
                    builder: (context, ref, child) {
                      return IconButton(
                        color: Colors.white,
                        onPressed: () {
                          ref.read(themeModeNotifierProvider.notifier).next();
                        },
                        icon: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 160),
                          child: KeyedSubtree(
                            key: ValueKey(ref.watch(themeModeNotifierProvider)),
                            child: switch (
                                ref.watch(themeModeNotifierProvider)) {
                              ThemeMode.dark => const Icon(Icons.dark_mode),
                              ThemeMode.light => const Icon(Icons.light_mode),
                              ThemeMode.system =>
                                const Icon(Icons.brightness_auto),
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const Expanded(
                child: ComponentTree(),
              ),
            ],
          ),
        );
      },
    );
  }
}
