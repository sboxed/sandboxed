import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vibook/addons/addon.dart';
import 'package:vibook/addons/param_builder_addon.dart';
import 'package:vibook/params/param_builder.dart';
import 'package:vibook_core/param.dart';

part 'addons.g.dart';

@riverpod
List<Addon> addonList(Ref ref) {
  return [];
}

@Riverpod(dependencies: [addonList])
class Addons extends _$Addons {
  @override
  List<Addon> build() {
    return ref.watch(addonListProvider);
  }

  ParamBuilder<T>? findParamBuilder<T>(Param<T> param) {
    for (final addon in state) {
      if (addon case ParamBuilderAddon addon) {
        final builder = addon.find(param);
        if (builder != null) return builder;
      }
    }

    return null;
  }
}
