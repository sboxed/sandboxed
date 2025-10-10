import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sandboxed/inspector/params_editor.dart';
import 'package:sandboxed/provider/params.dart';
import 'package:sandboxed/provider/selected.dart';

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

    return DefaultTextStyle.merge(
      style: TextStyle(
        color: Theme.of(context).colorScheme.onSurface,
      ),
      child: Column(
        children: [
          if (hasSelection) ...[
            if (ref
                .watch(paramsProvider(ref.watch(paramsScopeIdProvider)))
                .items
                .isNotEmpty)
              const Flexible(child: ParamsEditor()),
          ] else
            const SizedBox(),
        ],
      ),
    );
  }
}
