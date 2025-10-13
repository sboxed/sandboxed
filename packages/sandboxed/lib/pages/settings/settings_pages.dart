import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
