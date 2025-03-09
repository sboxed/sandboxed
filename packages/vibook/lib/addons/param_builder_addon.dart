import 'package:vibook/addons/addon.dart';
import 'package:vibook/params/param_builder.dart';
import 'package:vibook/vibook.dart';

base mixin ParamBuilderAddon on Addon {
  List<ParamBuilder> get paramBuilders;

  ParamBuilder<T>? find<T>(ParamWrapper<T> param) {
    for (final builder in paramBuilders) {
      if (builder.canBuild(param)) {
        return builder as ParamBuilder<T>;
      }
    }

    return null;
  }
}
