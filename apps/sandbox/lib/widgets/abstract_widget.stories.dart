import 'package:sandboxed/sandboxed.dart';
import 'package:sandboxed_core/sandboxed_core.dart';
import 'package:sandboxed_sandbox/widgets/abstract_widget.dart';

Meta get meta => const Meta<AbstractWidget>(
      name: "Edge Cases / Abstract Widgets",
    );

Story get $Default => Story(
      builder: (context, params) => ImplementerWidget(
        name: params.string('name').required("John Doe"),
      ),
    );

Story get $NoBuilder => const Story(
      decorators: [
        Annotate(
          text: 'Error here is expected',
          subtitle: 'This story shows error widget '
              'because builder was not provided.\n'
              'Abstract widgets cannot be instantiated automatically. '
              'Because of that Sandboxed expects builder to be provided in story manually.',
        )
      ],
    );
