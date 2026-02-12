import 'package:flutter/material.dart';
import 'package:sandboxed_core/src/exception/unsupported_generic_parameters_exception.dart';
import 'package:sandboxed_core/src/widgets/sandboxed_generic_error_widget.dart';

/// A widget that is used to display an error when a component has
/// generic type parameters that cannot be automatically resolved.
class SandboxedUnsupportedGenericParametersErrorWidget extends StatelessWidget {
  final UnsupportedGenericParametersException exception;

  const SandboxedUnsupportedGenericParametersErrorWidget({
    super.key,
    required this.exception,
  });

  @override
  Widget build(BuildContext context) {
    final paramsList = exception.parameters.entries
        .map((e) => '- ${e.key}: ${e.value}')
        .join('\n');

    return SandboxedGenericErrorWidget(
      message: 'Component has unsupported generic type parameters '
          'and cannot be built automatically.\n\n'
          'Parameters:\n$paramsList',
    );
  }
}
