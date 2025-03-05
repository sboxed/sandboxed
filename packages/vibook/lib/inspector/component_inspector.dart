import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recase/recase.dart';
import 'package:vibook/provider/addons.dart';
import 'package:vibook/provider/params.dart';
import 'package:vibook/provider/selected.dart';
import 'package:vibook/widgets/component_documentation.dart';
import 'package:vibook/widgets/story_name.dart';

// STOPSHIP(@melvspace): 03/04/25 not params
class ComponentInspector extends ConsumerStatefulWidget {
  const ComponentInspector({super.key});

  @override
  ConsumerState<ComponentInspector> createState() => _ComponentInspectorState();
}

class _ComponentInspectorState extends ConsumerState<ComponentInspector> {
  bool _showDocumentation = false;
  bool get showDocumentation => _showDocumentation;
  set showDocumentation(bool value) {
    if (mounted && _showDocumentation != value) {
      setState(() => _showDocumentation = value);
    }
  }

  @override
  Widget build(BuildContext context) {
    final selection = ref.watch(selectedElementProvider);
    final hasSelection = selection != null;

    final documents =
        hasSelection ? selection.component.meta().documentation : null;
    final hasDocumentation = documents?.isNotEmpty == true;

    return DefaultTextStyle.merge(
      style: TextStyle(
        color: Theme.of(context).colorScheme.onSurface,
      ),
      child: Column(
        children: [
          AppBar(
            title: const StoryName(),
            backgroundColor: Colors.transparent,
            actions: [
              if (hasDocumentation)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ChoiceChip(
                    showCheckmark: false,
                    selected: showDocumentation,
                    onSelected: (value) => showDocumentation = value,
                    // onPressed: () => showDocumentation = !showDocumentation,

                    label: Text('Docs'),
                  ),
                )
            ],
          ),
          if (hasSelection) ...[
            if (showDocumentation) ...[
              if (selection.component.meta().documentation?.first.content
                  case String documentation)
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ComponentDocumentation(
                      body: documentation.trim(),
                    ),
                  ),
                )
            ] else
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
