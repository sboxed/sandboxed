import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vibook/params/params_notifier.dart';
import 'package:vibook/provider/selected.dart';

part 'params.g.dart';

@riverpod
ParamsNotifier params(Ref ref) {
  ref.listen(
    selectedElementProvider,
    (previous, next) {
      if (previous != next) ref.invalidateSelf();
    },
  );

  return ParamsNotifier();
}
