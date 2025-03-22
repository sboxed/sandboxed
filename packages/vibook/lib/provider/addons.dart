import 'dart:developer';

import 'package:flat/flat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vibook/addons/addon.dart';
import 'package:vibook/addons/mixins/param_builder_addon.dart';
import 'package:vibook/params/param_builder.dart';
import 'package:vibook/widgets/revive.dart';
import 'package:vibook_core/vibook_core.dart';

part 'addons.g.dart';

@Riverpod(dependencies: [])
List<Addon> addonList(Ref ref) {
  return [];
}

@Riverpod(dependencies: [addonList], keepAlive: true)
class Addons extends _$Addons {
  @override
  List<Addon> build() {
    return ref.watch(addonListProvider);
  }

  ParamBuilder<T>? findParamBuilder<T>(ParamWrapper<T> param) {
    for (final addon in state) {
      if (addon case ParamBuilderAddon addon) {
        final builder = addon.find(param);
        if (builder != null) return builder;
      }
    }

    return null;
  }
}

// ?path=/story/typography-body--sizes
// &args=size:m;weight:regular;decoration:italic
// &globals=colorScheme:dark;measureEnabled:!true

@Riverpod(keepAlive: true, dependencies: [Addons])
class AddonQuery extends _$AddonQuery {
  late List<Addon> _addons;

  String _compute() {
    final state = <String, dynamic>{};
    for (final addon in _addons) {
      final data = addon.encodeWithDifference();
      if (data != null) {
        state[addon.id] = data;
      }
    }

    final query = flatten(state) //
        .entries
        .map((e) => '${e.key}:${e.value}')
        .join(';');

    return query;
  }

  void _update() {
    state = _compute();
    ref.notifyListeners();
  }

  @override
  String? build() {
    _addons = ref.watch(addonsProvider);

    final listenable = Listenable.merge(_addons);
    listenable.addListener(_update);
    ref.onDispose(() => listenable.removeListener(_update));

    return _compute();
  }

  void applyDeeplink(String global) {
    final parts = global.split(';');
    final entries = parts.map(
      (e) {
        final [key, value] = e.split(':');
        return MapEntry(key, revive(value));
      },
    );

    final map = unflatten(Map.fromEntries(entries));

    for (final addon in _addons) {
      final state = map[addon.id];
      if (state == null) continue;

      try {
        addon.decode(state);
      } catch (e, s) {
        log(
          'Failed to apply state to addon(${addon.id})',
          error: e,
          stackTrace: s,
          name: '$AddonQuery',
        );
        continue;
      }
    }

    state = global;

    ref.notifyListeners();
  }
}
