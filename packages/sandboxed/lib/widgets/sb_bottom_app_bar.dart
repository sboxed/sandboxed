import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconify_flutter_plus/icons/fa.dart';
import 'package:iconify_flutter_plus/icons/mdi.dart';
import 'package:sandboxed/inspector/addons_inspector.dart';
import 'package:sandboxed/inspector/component_inspector.dart';
import 'package:sandboxed/provider/params.dart';
import 'package:sandboxed/provider/selected.dart';
import 'package:sandboxed_ui_kit/sandboxed_ui_kit.dart';

class SBBottomAppBar extends ConsumerWidget {
  final ScaffoldState? scaffold;

  const SBBottomAppBar({super.key, this.scaffold});

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
              icon: const SBIcon(
                Fa.bars,
                size: 18,
              ),
              onPressed: () => scaffold.openDrawer(),
            ),
            if (ref.watch(selectedElementProvider) is StorySelection &&
                params.items.isNotEmpty)
              IconButton(
                tooltip: 'Params',
                icon: const SBIcon(Mdi.rhombus_split),
                onPressed: () {
                  final id = ref.read(selectedElementNotifierProvider)!;

                  // TODO(@melvspace): 08/21/25 removed parent from ProviderScope, investigate consequences
                  // final scope = ProviderScope.containerOf(context);

                  showModalBottomSheet(
                    context: context,
                    builder: (context) => ProviderScope(
                      child: ComponentInspector(
                        id: id,
                        position: null,
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
