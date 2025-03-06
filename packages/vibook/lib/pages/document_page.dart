import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vibook/provider/selected.dart';
import 'package:vibook/toolbar/toolbar.dart';
import 'package:vibook/widgets/component_documentation.dart';
import 'package:vibook/widgets/wip.dart';

// TODO(@melvspace): 03/05/25 add id

@RoutePage()
class DocumentPage extends ConsumerWidget {
  final String id;

  const DocumentPage({
    super.key,
    @PathParam() required this.id,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: _DocumentPageContent(),
    );
  }
}

class _DocumentPageContent extends ConsumerWidget {
  const _DocumentPageContent();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selection = ref.watch(selectedElementProvider);
    switch (selection) {
      case DocumentSelection(:final component, :final document):
        return Column(
          children: [
            const WIP(child: Toolbar()),
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
