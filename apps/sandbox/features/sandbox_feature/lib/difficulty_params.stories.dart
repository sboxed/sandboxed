import 'package:flutter/widgets.dart';
import 'package:sandbox_feature/sandbox_feature.dart';
import 'package:sandboxed_core/sandboxed_core.dart';

Meta get meta => Meta<Text>(name: "Difficulty Params (Outer)");

Story get $Default => Story(
  builder: (context, params) {
    return Text(
      params
          .difficulty('difficulty') //
          .required(Difficulty.medium)
          .name,
    );
  },
);
