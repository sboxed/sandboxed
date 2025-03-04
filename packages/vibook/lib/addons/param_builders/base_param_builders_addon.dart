import 'package:vibook/addons/addon.dart';
import 'package:vibook/addons/param_builder_addon.dart';
import 'package:vibook/addons/param_builders/base_param_builders/boolean_param_builder.dart';
import 'package:vibook/addons/param_builders/base_param_builders/color_param_builder.dart';
import 'package:vibook/addons/param_builders/base_param_builders/single_chips_param_builder.dart';
import 'package:vibook/addons/param_builders/base_param_builders/string_param_builder.dart';
import 'package:vibook/params/param_builder.dart';

final class BaseParamBuildersAddon extends Addon with ParamBuilderAddon {
  @override
  String get id => 'base_param_builders';

  @override
  List<ParamBuilder> get paramBuilders => [
        BooleanParamBuilder(),
        StringParamBuilder(),
        ColorParamBuilder(),

        // chips
        SingleChipsParamBuilder(),
        MultiChipsParamBuilder(),
      ];
}
