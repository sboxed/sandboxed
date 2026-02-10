import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sandboxed/provider/selected.dart';
import 'package:sandboxed/widgets/component_documentation.dart';
import 'package:sandboxed/widgets/element_name.dart';
import 'package:sandboxed/widgets/sb_bottom_app_bar.dart';
import 'package:sandboxed_ui_kit/sandboxed_ui_kit.dart';

class DocumentPage extends ConsumerWidget {
  final String? id;

  const DocumentPage({
    super.key,
    this.id,
  }) : assert(id != null, 'id cant be null');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final parentScaffold = Scaffold.of(context);

    return Scaffold(
      bottomNavigationBar: switch (context.breakpoint) {
        Breakpoints.mobile => SBBottomAppBar(scaffold: parentScaffold),
        _ => null,
      },
      body: _DocumentPageContent(id: id),
    );
  }
}

class _DocumentPageContent extends ConsumerWidget {
  final String? id;

  const _DocumentPageContent({this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final id = this.id;
    if (id == null) {
      return ErrorWidget(StateError("Story ID not provided"));
    }

    final selection = ref.watch(selectionProvider(id));
    switch (selection) {
      case DocumentSelection(:final component, :final document):
        return Column(
          children: [
            Card(
              child: Column(
                children: [
                  AppBar(
                    title: ElementName(id: id),
                    scrolledUnderElevation: 0,
                    automaticallyImplyLeading: false,
                    backgroundColor: Colors.transparent,
                  ),
                ],
              ),
            ),
            Flexible(
              child: ComponentDocumentation(
                body: '# ${component.meta.displayName} / ${document.name}\n\n'
                    '${document.content}',
              ),
            ),
          ],
        );

      default:
        return const Center(
          child: Text(
            "Something goes wrong",
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
    }
  }
}
