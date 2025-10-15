import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sandboxed/params/editors/editors.dart';
import 'package:sandboxed/provider/params.dart';
import 'package:sandboxed/sandboxed.dart';

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

    return LayoutBuilder(
      builder: (context, constraints) {
        final small = constraints.maxWidth < 600;

        return SingleChildScrollView(
          child: DecoratedBox(
            decoration: BoxDecoration(border: Border(bottom: border)),
            child: Table(
              border: TableBorder.symmetric(inside: border),
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              columnWidths: {
                0: IntrinsicColumnWidth(),
                if (small)
                  1: const FlexColumnWidth(4)
                else
                  2: const FlexColumnWidth(4),
              },
              children: [
                TableRow(
                  children: [
                    cell(
                      const Text('Name'),
                      const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    if (!small) ...[
                      // TODO(@melvspace): 03/30/25 get types at generation step
                      cell(
                        const Text('Description'),
                        const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                    cell(
                      Row(
                        children: [
                          const Text('Control'),
                          const Spacer(),
                          IconButton(
                              onPressed: () => ref
                                  .read(paramsProvider(
                                      ref.watch(paramsScopeIdProvider)))
                                  .reset(),
                              icon: const Icon(Icons.replay))
                        ],
                      ),
                      const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                for (final param in ref
                    .watch(paramsProvider(ref.watch(paramsScopeIdProvider)))
                    .items
                    .entries)
                  TableRow(
                    children: [
                      cell(
                        Tooltip(
                          message: param.key,
                          waitDuration: const Duration(milliseconds: 250),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 32),
                            child: Text(
                              param.key,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                      if (!small) ...[
                        cell(
                          Text(
                            switch (param.value.metadata['description']) {
                              String description
                                  when description.trim().isNotEmpty =>
                                description.trim(),
                              _ when !kIsWeb => formatType(param.value),
                              _ => '-',
                            },
                          ),
                        ),
                      ],
                      cell(ParamEditorCell(id: param.key, value: param.value)),
                    ],
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  // TODO(@melvspace): 05/07/25 get types at generation step
  String formatType(ParamValue value) {
    final regexp = RegExp('^.*ParamValue<');
    var string = '${value.runtimeType}';
    if (string.contains(regexp)) {
      string = string.replaceAll(regexp, '');
      string = string.replaceAll(RegExp('>\$'), '');
    }

    if (!value.required) {
      string += '?';
    }

    return string;
  }
}

class ParamEditorCell extends ConsumerWidget {
  final String id;
  final ParamValue value;

  const ParamEditorCell({
    super.key,
    required this.id,
    required this.value,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListenableBuilder(
      listenable: value,
      builder: (context, child) {
        final presenter = value.editor;
        if (presenter == null) {
          return NullableEditorWidget(
            value: value,
            child: ReadonlyEditorWidget(value: value),
          );
        }

        return NullableEditorWidget(
          value: value,
          child: Align(
            alignment: AlignmentDirectional.centerStart,
            child: presenter.build(context, value),
          ),
        );
      },
    );
  }
}
