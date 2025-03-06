import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recase/recase.dart';
import 'package:vibook/provider/addons.dart';
import 'package:vibook/provider/params.dart';
import 'package:vibook/provider/selected.dart';
import 'package:vibook/widgets/element_name.dart';

// STOPSHIP(@melvspace): 03/04/25 not params
class ComponentInspector extends ConsumerStatefulWidget {
  final String id;

  const ComponentInspector({
    super.key,
    required this.id,
  });

  @override
  ConsumerState<ComponentInspector> createState() => _ComponentInspectorState();
}

class _ComponentInspectorState extends ConsumerState<ComponentInspector> {
  @override
  Widget build(BuildContext context) {
    final selection = ref.watch(selectionProvider(widget.id));
    final hasSelection = selection != null;

    final documents =
        hasSelection ? selection.component.meta.documentation : null;
    final hasDocumentation = documents?.isNotEmpty == true;

    return DefaultTextStyle.merge(
      style: TextStyle(
        color: Theme.of(context).colorScheme.onSurface,
      ),
      child: Column(
        children: [
          AppBar(
            title: ElementName(id: widget.id),
            backgroundColor: Colors.transparent,
            actions: [
              if (hasDocumentation)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ActionChip(
                    // TODO(@melvspace): 03/06/25 navigate to docs.
                    // onPressed: () => AutoRouter.of(context).navigate(),
                    label: Text('Docs'),
                  ),
                )
            ],
          ),
          if (hasSelection) ...[
            Flexible(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: [
                  for (final param in ref.watch(paramsProvider).items.entries)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Builder(builder: (context) {
                        final editor = ref
                            .watch(addonsProvider.notifier)
                            .findParamBuilder(param.value)
                            ?.buildEditor(
                              param.key,
                              param.value,
                              ref.watch(paramsProvider),
                              ref,
                            );

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                '${param.key.toString().titleCase}${editor == null ? ' [Readonly]' : ''}'),
                            const SizedBox(height: 8),
                            if (editor case Widget editor)
                              editor
                            else
                              Text(param.value.value.toString()),
                          ],
                        );
                      }),
                    ),
                ],
              ),
            ),
          ] else
            const SizedBox(),
        ],
      ),
    );
  }
}
