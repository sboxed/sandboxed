import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconify_flutter_plus/icons/mdi.dart';
import 'package:vibook/inspector/addons_inspector.dart';
import 'package:vibook/inspector/component_inspector.dart';
import 'package:vibook/provider/selected.dart';
import 'package:vibook/widgets/vi_icon.dart';

class ViBottomAppBar extends ConsumerWidget {
  const ViBottomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BottomAppBar(
      child: Row(
        children: <Widget>[
          IconButton(
            tooltip: 'Open navigation menu',
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
          if (ref.watch(selectedElementProvider) is StorySelection)
            IconButton(
              tooltip: 'Params',
              icon: const ViIcon(Mdi.rhombus_split),
              onPressed: () {
                final id = ref.read(selectedElementNotifierProvider)!;
                final scope = ProviderScope.containerOf(context);

                showModalBottomSheet(
                  context: context,
                  builder: (context) => ProviderScope(
                    parent: scope,
                    child: ComponentInspector(
                      id: id,
                    ),
                  ),
                );
              },
            ),
          IconButton(
            tooltip: 'Addons',
            icon: const Icon(Icons.settings),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Column(
                    children: [
                      AppBar(
                        title: const Text("Addons"),
                        backgroundColor: Colors.transparent,
                      ),
                      const SizedBox(height: 12),
                      const Flexible(
                        child: AddonsInspector(),
                      ),
                    ],
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
