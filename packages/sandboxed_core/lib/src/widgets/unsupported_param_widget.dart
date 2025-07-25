import 'package:flutter/material.dart';
import 'package:sandboxed_core/src/params/params.dart';
import 'package:sandboxed_core/src/widgets/widgets.dart';

/// A widget that shows an error message when a story has unsupported parameters
///
/// This widget is used as a fallback when a story has parameters that are not
/// supported by the current Sandboxed version. It shows an error message with
/// the name and type of the unsupported parameter.
///
/// The error message is displayed as a red `Card` with a white error icon and
/// text. The text is a single line with the name of the parameter and its type.
///
/// The widget is typically used in the `StoryView` when a story has unsupported
/// parameters.
class UnsupportedParamWidget extends StatelessWidget {
  final UnsupportedParamException exception;

  const UnsupportedParamWidget({
    super.key,
    required this.exception,
  });

  String paramType(ParamWrapper param) {
    return RegExp('<(.+)>')
            .firstMatch(param.runtimeType.toString())
            ?.group(1) ??
        '<unknown type>';
  }

  @override
  Widget build(BuildContext context) {
    return SandboxedGenericErrorWidget(
      message: 'Story has unsupported parameters\n'
          '- [${exception.param.id}] of type ${paramType(exception.param)}',
    );
  }
}
