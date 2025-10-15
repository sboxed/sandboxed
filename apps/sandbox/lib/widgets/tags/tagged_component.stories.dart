import 'package:sandboxed_core/sandboxed_core.dart';
import 'package:sandboxed_sandbox/widgets/tags/tagged_component.dart';

Meta get meta => const Meta<TaggedComponent>(
  name: 'Tagged Component',
  module: 'Tags',
  tags: ['autodocs', 'test', 'deprecated'],
);

Story get $Default => const Story();
