import 'package:flutter/widgets.dart';
import 'package:sandboxed_core/sandboxed_core.dart';
import 'package:sandboxed_sandbox/widgets/automatic/unsupported_parameters.dart';

Meta get meta => const Meta<UnsupportedParameters>(
      name: 'Unsupported Params',
    );

Story get $Default => const Story();

Story get $WithParams => const Story(
      params: {
        'style': TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w900,
        ),
      },
    );

Story get $WithBuilder => Story(
      builder: (context, params) => UnsupportedParameters(
        style: TextStyle(fontSize: params.number('fontSize').required(24)),
      ),
    );
