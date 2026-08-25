import 'dart:developer';

import 'package:flat/flat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sandboxed/addons/addon.dart';
import 'package:sandboxed/widgets/revive.dart';

List<Addon> addonList(Ref ref) {
  return [];
}

final addonListProvider = Provider.autoDispose<List<Addon>>(
  addonList,
  dependencies: const [],
);

final addonsProvider = NotifierProvider<Addons, List<Addon>>(
  Addons.new,
  dependencies: [addonListProvider],
);

final addonQueryProvider = NotifierProvider<AddonQuery, String?>(
  AddonQuery.new,
  dependencies: [addonsProvider],
);

class Addons extends Notifier<List<Addon>> {
  @override
  List<Addon> build() {
    return ref.watch(addonListProvider);
  }
}

// ?path=/story/typography-body--sizes
// &args=size:m;weight:regular;decoration:italic
// &globals=colorScheme:dark;measureEnabled:!true

class AddonQuery extends Notifier<String?> {
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
