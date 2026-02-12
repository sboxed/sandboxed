import 'package:sandboxed/sandboxed.dart';
import 'package:sandboxed_sandbox/widgets/params/generic_params.dart';

Meta get meta => Meta<GenericContainer>(
  name: 'Params / Generic Params',
);

Story get $Default => Story(
  decorators: [
    Annotate(
      text: "Error here is expected",
      subtitle:
          "This story shows error widget because component has unsupported "
          "parameters and cannot be built automatically. ",
    ),
  ],
);
