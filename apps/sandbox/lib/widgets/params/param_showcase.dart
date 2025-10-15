import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/atom-one-dark.dart';
import 'package:recase/recase.dart';
import 'package:sandboxed/params/editors/nullable_editor_widget.dart';
import 'package:sandboxed/sandboxed.dart';
import 'package:sandboxed_sandbox/widgets/params/param_builder.dart';

class ParamShowcase extends StatelessWidget {
  final String title;
  final ParamOptionality optionality;
  final List<ParamShowcaseItem> rows;

  final ParamStorage params;

  const ParamShowcase({
    super.key,
    required this.title,
    required this.rows,
    required this.optionality,
    required this.params,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          Table(
            columnWidths: {
              0: const FlexColumnWidth(1),
              1: const FlexColumnWidth(3),
              2: const FlexColumnWidth(2),
              3: const FlexColumnWidth(6),
            },
            border: TableBorder.symmetric(
              inside: BorderSide(
                color: Theme.of(context).colorScheme.onSecondaryFixedVariant,
              ),
              outside: BorderSide(
                color: Theme.of(context).colorScheme.secondaryFixed,
              ),
            ),
            children: [
              TableRow(
                children:
                    [
                          Text(
                            'ID',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Example Code',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Value',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'UI',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ]
                        .map(
                          (e) => Padding(
                            padding: EdgeInsets.all(8).copyWith(right: 32),
                            child: e,
                          ),
                        )
                        .toList(),
              ),
              for (final (index, row) in rows.indexed)
                () {
                  var id = title.snakeCase;
                  if (row.name case String name) {
                    id += "_${name.snakeCase}";
                  } else if (index != 0) {
                    id += "$index";
                  }

                  dynamic value;
                  String? error;
                  try {
                    value = switch (optionality) {
                      ParamOptionality.optional => row.builder(id).optional(),
                      ParamOptionality.required => row.builder(id).required(row.value as dynamic),
                      ParamOptionality.default$ => row.builder(id).default$(),
                    };
                  } catch (e) {
                    error = e.toString();
                  }

                  return TableRow(
                    children:
                        [
                          Text(id),
                          HighlightView(
                            row.code,
                            language: 'dart',
                            tabSize: 2,
                            padding: EdgeInsets.all(8),
                            theme: atomOneDarkTheme,
                          ),
                          Text(
                            row.render?.call(value) ?? //
                                value.toString(),
                          ),
                          Builder(
                            builder: (context) {
                              final value = params.get(id);
                              if (value == null) {
                                return Text(
                                  "Failed to register value\n$error",
                                  style: TextStyle(color: Colors.red),
                                );
                              }

                              final editor = value.editor;

                              if (editor == null) {
                                return Text("Editor UI not found");
                              }

                              return NullableEditorWidget(
                                value: value,
                                child: editor.build(context, value),
                              );
                            },
                          ),
                        ].indexed.map((e) {
                          if (e.$1 == 3) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: e.$2,
                            );
                          }

                          return Padding(
                            padding: EdgeInsets.all(8).copyWith(right: 32),
                            child: e.$2,
                          );
                        }).toList(),
                  );
                }(),
            ],
          ),
        ],
      ),
    );
  }
}
