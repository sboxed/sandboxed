import 'package:sandboxed_core/sandboxed_core.dart';
import 'package:sandboxed_sandbox/widgets/nullable_and_required/nullable_and_required_params.dart';

Meta get meta => const Meta<NullableAndRequiredParamsWidget>(
      name: 'Params Table',
    );

Story get $Automatic => const Story();

Story get $Manual => Story(
      builder: (context, params) {
        return NullableAndRequiredParamsWidget(
          requiredText: params.string('requiredTest').required('Text'),
          requiredBoolean: params.boolean('requiredBoolean').required(true),
          requiredDouble: params.number('requiredDouble').required(123),
          requiredInteger: params.integer('requiredInteger').required(0),
          boolean: params.boolean('boolean').optional(null),
          double$: params.number('double\$').optional(null),
          text: params.string('text').optional(null),
          integer: params.integer('integer').optional(null),
        );
      },
    );
