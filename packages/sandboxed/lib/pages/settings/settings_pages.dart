import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recase/recase.dart';
import 'package:sandboxed/feature_flags.dart';
import 'package:sandboxed/pages/settings/widgets/interface_scale_setting.dart';
import 'package:sandboxed/provider/settings.dart';
import 'package:sandboxed/widgets/sb_bottom_app_bar.dart';
import 'package:sandboxed_ui_kit/sandboxed_ui_kit.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final parentScaffold = Scaffold.maybeOf(context);

    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      bottomNavigationBar: switch (context.breakpoint) {
        Breakpoints.mobile => SBBottomAppBar(scaffold: parentScaffold),
        _ => null,
      },
      body: ListView(
        children: [
          Consumer(
            builder: (context, ref, child) {
              final interfaceScale = ref.watch(settingStorageProvider
                  .select((value) => value.interfaceScale));

              return InterfaceScaleSetting(
                value: interfaceScale ?? 1.0,
                onChanged: (value) {
                  ref.read(settingStorageProvider.notifier).update(
                    (current) {
                      return current.copyWith(interfaceScale: value);
                    },
                  );
                },
              );
            },
          ),
          Consumer(
            builder: (context, ref, child) {
              final denseExplorer = ref.watch(settingStorageProvider
                  .select((value) => value.denseExplorer));

              return ListTile(
                title: Text("Dense explorer"),
                trailing: Switch(
                  value: denseExplorer,
                  onChanged: (value) => ref
                      .read(settingStorageProvider.notifier) //
                      .update(
                        (current) => current.copyWith(denseExplorer: value),
                      ),
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0)
                .copyWith(top: 16, bottom: 8),
            child: Text(
              "Experimental",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          for (final flag in FeatureFlags.values)
            Consumer(
              builder: (context, ref, child) {
                final optInFeatures = ref
                    .watch(settingStorageProvider
                        .select((value) => value.optInFeatures))
                    .toSet();

                return ListTile(
                  title: Text(flag.title),
                  subtitle: Text(flag.description),
                  trailing: Switch(
                    value: optInFeatures.contains(flag),
                    onChanged: (value) {
                      if (value) {
                        optInFeatures.add(flag);
                      } else {
                        optInFeatures.remove(flag);
                      }

                      ref
                          .read(settingStorageProvider.notifier) //
                          .update(
                            (current) => current.copyWith(
                              optInFeatures: optInFeatures,
                            ),
                          );
                    },
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}

class S extends StatelessWidget {
  const S({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
