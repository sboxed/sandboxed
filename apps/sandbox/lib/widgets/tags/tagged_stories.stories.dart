import 'package:sandboxed_core/sandboxed_core.dart';
import 'package:sandboxed_sandbox/widgets/tags/tagged_stories.dart';

Meta get meta => const Meta<TaggedStories>(
      name: 'Tagged Stories',
      module: 'Tags',
      tags: [
        'experimental',
      ],
    );

Story get $New => const Story(
      tags: ['new'],
    );

Story get $Deprecated => const Story(
      tags: ['!experimental', 'deprecated'],
    );
