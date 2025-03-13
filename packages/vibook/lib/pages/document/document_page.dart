import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vibook/provider/selected.dart';
import 'package:vibook/toolbar/toolbar.dart';
import 'package:vibook/widgets/component_documentation.dart';
import 'package:vibook/widgets/element_name.dart';
import 'package:vibook/widgets/vi_bottom_app_bar.dart';
import 'package:vibook/widgets/wip.dart';
import 'package:vibook_ui_kit/vibook_ui_kit.dart';

@RoutePage()
class DocumentPage extends ConsumerWidget {
  final String id;

  const DocumentPage({
    super.key,
    @PathParam() required this.id,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final parentScaffold = Scaffold.of(context);

    return Scaffold(
      bottomNavigationBar: switch (context.breakpoint) {
        Breakpoints.mobile => ViBottomAppBar(scaffold: parentScaffold),
        _ => null,
      },
      body: _DocumentPageContent(id: id),
    );
  }
}

class _DocumentPageContent extends ConsumerWidget {
  final String id;

  const _DocumentPageContent({required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                  const WIP(child: Toolbar()),
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
