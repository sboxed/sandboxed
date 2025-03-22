import 'package:sandboxed/addons/addon.dart';
import 'package:sandboxed/params/param_builder.dart';
import 'package:sandboxed/sandboxed.dart';

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
