import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vibook/inspector/params_editor.dart';
import 'package:vibook/params/param_builder.dart';
import 'package:vibook/provider/params.dart';
import 'package:vibook/provider/selected.dart';

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

class NullSwitcher extends ConsumerWidget {
  final String id;
  final ParamBuilder builder;

  const NullSwitcher({
    super.key,
    required this.id,
    required this.builder,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final params = ref.watch(paramsProvider(ref.watch(paramsScopeIdProvider)));
    final param = params.items[id];

    if (param == null) return const SizedBox();
    if (param.isRequired) return const SizedBox();

    final initialValue = builder.getInitialValueFor(param);
    if (initialValue == null && param.rawValue == null) return const SizedBox();

    return ActionChip(
      onPressed: () {
        param.null$ = false;
        param.value ??= initialValue;

        // TODO(@melvspace): 03/09/25 change api to support null$ change without warnings.
        // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
        params.notifyListeners();
      },
      label: const Text('Set value'),
    );
  }
}
