import 'package:vibook_core/vibook_core.dart';
import 'package:vibook_sandbox/widgets/nullable_and_required/nullable_and_required_params.dart';

Meta get meta => const Meta<NullableAndRequiredParamsWidget>();

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
