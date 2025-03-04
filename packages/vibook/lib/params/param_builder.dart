import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vibook/params/params_notifier.dart';
import 'package:vibook/provider/params.dart';
import 'package:vibook_core/param.dart';

abstract class ParamBuilder<TValue> {
  bool canBuild(Param param);

  Widget build(String id, Param<TValue> param, ParamsNotifier params);

  Widget buildEditor(
    String id,
    Param<TValue> param,
    ParamsNotifier params,
    WidgetRef ref,
  ) {
    return ListenableBuilder(
      listenable: ref.watch(paramsProvider),
      builder: (context, _) => build(id, param, params),
    );
  }
}
