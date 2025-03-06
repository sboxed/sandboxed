import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vibook/params/params_notifier.dart';

part 'params.g.dart';

@Riverpod(dependencies: [])
Raw<ParamsNotifier> params(Ref ref) {
  return ParamsNotifier();
}
