import 'package:sandboxed_core/sandboxed_core.dart';
import 'package:sandboxed_sandbox/widgets/automatic/automatic_generation.dart';

Meta get meta => const Meta<AutomaticGeneration>(
      name: 'Automatic Generation',
    );

Story get $Default => const Story();

Story get $Enabled => Story(
      params: {
        'unsupported': () {},
      },
    );
