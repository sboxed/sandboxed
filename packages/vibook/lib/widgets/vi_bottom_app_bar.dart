import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconify_flutter_plus/icons/fa.dart';
import 'package:iconify_flutter_plus/icons/mdi.dart';
import 'package:vibook/inspector/addons_inspector.dart';
import 'package:vibook/inspector/component_inspector.dart';
import 'package:vibook/provider/params.dart';
import 'package:vibook/provider/selected.dart';
import 'package:vibook_ui_kit/vibook_ui_kit.dart';

class ViBottomAppBar extends ConsumerWidget {
  final ScaffoldState? scaffold;

  const ViBottomAppBar({super.key, this.scaffold});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scaffold = this.scaffold ?? Scaffold.of(context);
    final params = ref.watch(paramsProvider(ref.watch(paramsScopeIdProvider)));

    return BottomAppBar(
      child: ListenableBuilder(
        listenable: params,
        builder: (context, child) => Row(
          children: <Widget>[
            IconButton(
              tooltip: 'Open navigation menu',
              icon: const ViIcon(
                Fa.bars,
                size: 18,
              ),
              onPressed: () => scaffold.openDrawer(),
            ),
            if (ref.watch(selectedElementProvider) is StorySelection &&
                params.items.isNotEmpty)
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
              icon: const Icon(Icons.settings_rounded),
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
            const Spacer(),
            FilledButton(
              onPressed: () {
                Clipboard.setData(
                  ClipboardData(
                    text: Uri.base.origin + AutoRouter.of(context).urlState.url,
                  ),
                );

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Link copied to clipboard"),
                  ),
                );
              },
              child: const Text("Share"),
            )
          ],
        ),
      ),
    );
  }
}
