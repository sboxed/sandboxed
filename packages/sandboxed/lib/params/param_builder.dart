import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sandboxed/params/params_notifier.dart';
import 'package:sandboxed/provider/params.dart';
import 'package:sandboxed_core/sandboxed_core.dart';

abstract class ParamBuilder<TValue> {
  TValue? getInitialValueFor(ParamWrapper<TValue> param);

  bool canBuild(ParamWrapper param);

  Widget build(String id, ParamWrapper<TValue> param, ParamsNotifier params);

  Widget buildEditor(
    String id,
    ParamWrapper<TValue> param,
    ParamsNotifier params,
    WidgetRef ref,
  ) {
    return ListenableBuilder(
      listenable: ref.watch(paramsProvider(ref.watch(paramsScopeIdProvider))),
      builder: (context, _) => build(id, param, params),
    );
  }
}
