import 'package:sandboxed/addons/addon.dart';
import 'package:sandboxed/addons/mixins/param_builder_addon.dart';
import 'package:sandboxed/addons/param_builders/base_param_builders/color_param_builder.dart';
import 'package:sandboxed/addons/param_builders/base_param_builders/core/boolean_param_builder.dart';
import 'package:sandboxed/addons/param_builders/base_param_builders/core/chips_param_builder.dart';
import 'package:sandboxed/addons/param_builders/base_param_builders/core/integer_param_builder.dart';
import 'package:sandboxed/addons/param_builders/base_param_builders/core/number_param_builder.dart';
import 'package:sandboxed/addons/param_builders/base_param_builders/core/string_param_builder.dart';
import 'package:sandboxed/addons/param_builders/base_param_builders/flutter/alignment_param_builder.dart';
import 'package:sandboxed/addons/param_builders/base_param_builders/flutter/edge_insets_param_builder.dart';
import 'package:sandboxed/addons/param_builders/base_param_builders/flutter/text_style_param_builder.dart';
import 'package:sandboxed/params/param_builder.dart';

final class BaseParamBuildersAddon extends Addon with ParamBuilderAddon {
  @override
  String get id => 'base_param_builders';

  @override
  List<ParamBuilder> get paramBuilders => [
        BooleanParamBuilder(),
        StringParamBuilder(),
        ColorParamBuilder(),
        IntegerParamBuilder(),
        NumberParamBuilder(),

        // chips
        SingleChipsParamBuilder(),
        MultiChipsParamBuilder(),

        // flutter
        AlignmentParamBuilder(),
        EdgeInsetsParamBuilder(),
        TextStyleParamBuilder(),
      ];
}
