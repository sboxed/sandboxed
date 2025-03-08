import 'package:flutter/widgets.dart';
import 'package:vibook_core/vibook_core.dart';
import 'package:vibook_sandbox/widgets/automatic/unsupported_parameters.dart';

Meta get meta => Meta<UnsupportedParameters>();

Story get $Default => Story();

Story get $WithParams => Story(
      params: {
        'padding': EdgeInsets.all(8),
        'style': TextStyle(fontSize: 24),
      },
    );

Story get $WithBuilder => Story(
      builder: (context, params) => UnsupportedParameters(
        padding: EdgeInsets.all(params.number('padding', 24)),
        style: TextStyle(fontSize: params.number('fontSize', 24)),
      ),
    );
