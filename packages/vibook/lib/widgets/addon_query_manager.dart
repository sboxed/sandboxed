import 'dart:developer';

import 'package:flat/flat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vibook/addons/addon.dart';
import 'package:vibook/provider/addons.dart';

class AddonQueryManager extends ConsumerWidget {
  final Widget child;

  const AddonQueryManager({
    super.key,
    required this.child,
  });

  void update(BuildContext context, List<Addon> addons) {
    final state = {
      for (final addon in addons) //
        if (addon.serialize() case Object data) //
          addon.id: data,
    };

    final query = flatten(state, delimiter: '.')
        .entries
        .map((e) => '${e.key}:${e.value}')
        .join(';');

    log(query);
    // TODO(@melvspace): 03/21/25 update url
    // AutoRouter.of(context).updateRouteData(RouteDa)
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addons = ref.watch(addonsProvider);

    return ListenableBuilder(
      listenable: Listenable.merge(addons),
      builder: (context, child) {
        update(context, addons);

        return child!;
      },
      child: child,
    );
  }
}
