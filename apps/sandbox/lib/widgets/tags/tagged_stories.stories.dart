import 'package:vibook_core/vibook_core.dart';
import 'package:vibook_sandbox/widgets/tags/tagged_stories.dart';

Meta get meta => const Meta<TaggedStories>(
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
