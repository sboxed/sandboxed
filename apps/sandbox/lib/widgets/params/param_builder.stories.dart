import 'package:sandboxed/sandboxed.dart';
import 'package:sandboxed_sandbox/widgets/params/param_builder.dart';
import 'package:sandboxed_sandbox/widgets/params/param_showcase.stories.dart';

Meta get meta => Meta<ParamBuildersSandbox>(name: "Params / Types");

Story get $Required => Story(
      decorators: [
        Annotate(
          text: "Parameters and Editors - Required",
          subtitle: """
This story shows multiple types of parameters and editors.

You also can add your own param types and editors through extension API.
    """,
        ),
      ],
      builder: (context, params) {
        return ParamBuildersSandbox(
          params: params,
          builder: build,
          optionality: ParamOptionality.required,
        );
      },
    );

Story get $Optional => Story(
      decorators: [
        Annotate(
          text: "Parameters and Editors - Optional",
          subtitle: """
This story shows multiple types of parameters and editors in optional mode.
    """,
        ),
      ],
      builder: (context, params) {
        return ParamBuildersSandbox(
          params: params,
          builder: build,
          optionality: ParamOptionality.optional,
        );
      },
    );

Story get $Default => Story(
      decorators: [
        Annotate(
          text: "Parameters and Editors - Default",
          subtitle: """
This story shows multiple types of parameters and editors in default mode.
    """,
        ),
      ],
      builder: (context, params) {
        return ParamBuildersSandbox(
          params: params,
          builder: build,
          optionality: ParamOptionality.default$,
        );
      },
    );

// -----------------------------------------------------------------------------

Map<String, List<ParamShowcaseItem>> build(ParamStorage params) {
  return {
    "string": buildStringShowcase(params),
    "integer": buildIntegerShowcase(params),
    "number": buildDoubleShowcase(params),
    "boolean": buildBooleanShowcase(params),
    "single": buildSingleShowcase(params),
    "multi": buildMultiShowcase(params),
    "datetime": buildDateTimeShowcase(params),
    "duration": buildDurationShowcase(params),
    "alignment": buildAlignmentShowcase(params),
    "color": buildColorShowcase(params),
    "gradient": buildGradientShowcase(params),
    "json": buildJsonShowcase(params),
  };
}
