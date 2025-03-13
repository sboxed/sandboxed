import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vibook/inspector/component_inspector.dart';
import 'package:vibook/provider/addons.dart';
import 'package:vibook/provider/params.dart';
import 'package:vibook/vibook.dart';
import 'package:vibook/widgets/wip.dart';

class ParamsEditor extends ConsumerWidget {
  const ParamsEditor({super.key});

  Widget cell(Widget child, [TextStyle? style]) {
    return DefaultTextStyle.merge(
      style: style,
      child: TableCell(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: child,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    final border = BorderSide(color: colors.surfaceContainerHigh);

    return SingleChildScrollView(
      child: DecoratedBox(
        decoration: BoxDecoration(border: Border(bottom: border)),
        child: Table(
          border: TableBorder.symmetric(inside: border),
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          columnWidths: {
            if (context.breakpoint == Breakpoints.mobile)
              1: const FlexColumnWidth(4)
            else
              3: const FlexColumnWidth(4),
          },
          children: [
            TableRow(
              children: [
                cell(const Text('Name'),
                    const TextStyle(fontWeight: FontWeight.bold)),
                if (context.breakpoint != Breakpoints.mobile) ...[
                  cell(const Text('Description'),
                      const TextStyle(fontWeight: FontWeight.bold)),
                  cell(const Text('Default'),
                      const TextStyle(fontWeight: FontWeight.bold)),
                ],
                cell(
                  Row(
                    children: [
                      const Text('Control'),
                      const Spacer(),
                      IconButton(
                          onPressed: () => ref.read(paramsProvider).reset(),
                          icon: const Icon(Icons.replay))
                    ],
                  ),
                  const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            for (final param in ref.watch(paramsProvider).items.entries)
              TableRow(
                children: [
                  cell(
                    Tooltip(
                      message: param.key,
                      waitDuration: const Duration(milliseconds: 250),
                      child: Text(
                        param.key,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  if (context.breakpoint != Breakpoints.mobile) ...[
                    cell(
                      Text(
                        switch (param.value.meta['description']) {
                          String description
                              when description.trim().isNotEmpty =>
                            description,
                          _ => '${param.value.runtimeType}'
                              '${!param.value.isRequired ? '?' : ''}',
                        },
                      ),
                    ),
                    cell(const WIP(child: Text('-'))),
                  ],
                  cell(ParamEditorCell(id: param.key, param: param.value)),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class ParamEditorCell extends ConsumerWidget {
  final String id;
  final ParamWrapper param;

  const ParamEditorCell({
    super.key,
    required this.id,
    required this.param,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final params = ref.watch(paramsProvider);
    final builder = ref.watch(addonsProvider.notifier).findParamBuilder(param);
    final editor = builder?.buildEditor(id, param, params, ref);

    return ListenableBuilder(
      listenable: params,
      builder: (context, child) {
        return Row(
          children: [
            if (!param.null$)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (editor case Widget editor)
                      Opacity(
                        opacity: param.null$ ? .5 : 1.0,
                        child: IgnorePointer(
                          ignoring: param.null$,
                          child: editor,
                        ),
                      )
                    else
                      Text(param.value.toString()),
                  ],
                ),
              )
            else if (builder != null) //
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: ListenableBuilder(
                  listenable: ref.watch(paramsProvider),
                  builder: (context, child) => NullSwitcher(
                    id: id,
                    builder: builder,
                  ),
                ),
              )
            else
              ViMarkdown('`${param.rawValue}`')
          ],
        );
      },
    );
  }
}
