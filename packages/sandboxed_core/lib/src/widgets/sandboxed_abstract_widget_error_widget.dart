import 'package:flutter/material.dart';
import 'package:sandboxed_core/src/widgets/sandboxed_generic_error_widget.dart';

/// A widget that is used to display an error when
/// a story for an abstract class is built without
/// a builder.
class SandboxedAbstractWidgetErrorWidget extends StatelessWidget {
  const SandboxedAbstractWidgetErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SandboxedGenericErrorWidget(
      message: 'Story for abstract widget class should '
          'have builder manually set.',
    );
  }
}
