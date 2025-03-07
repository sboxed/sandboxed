import 'package:vibook_core/vibook_core.dart';
import 'package:vibook_sandbox/widgets/automatic/automatic_generation.dart';

Meta get meta => Meta<AutomaticGeneration>();

Story get $Default => Story();

Story get $Enabled => Story(
      params: {
        'unsupported': () {},
      },
    );
