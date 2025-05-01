import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sandboxed/params/param_builder.dart';
import 'package:sandboxed_core/sandboxed_core.dart';

void safeAssign(void Function(dynamic value) assign, dynamic value) {
  try {
    assign(value);
  } on TypeError {
    if (value is int) {
      assign(value.toDouble());
    } else {
      rethrow;
    }
  }
}

class ParamsNotifier extends ChangeNotifier implements Params {
  final Map<String, ParamWrapper> _params = {};
  final Map<String, dynamic> _initialValues = {};
  final List<ParamBuilder> _builders;

  late DefaultValueResolver _defaultValueResolver = DefaultValueResolver(
    params: this,
    defaultValues: {},
  );

  ParamsNotifier({required List<ParamBuilder> builders}) : _builders = builders;

  Map<String, ParamWrapper> get items => UnmodifiableMapView(_params);

  final PublishSubject<String> _added = PublishSubject();
  Stream<String> get onParamAdded => _added;

  TWrapper register<TWrapper extends ParamWrapper<TParam>, TParam, T1, T2>(
    String id, {
    TWrapper Function()? wrapperFactory,
  }) {
    var isCreation = !_params.containsKey(id);
    final wrapper = _params.putIfAbsent(
      id,
      () => (wrapperFactory?.call() ?? ParamWrapper<TParam>()).bind(id, this),
    ) as TWrapper;

    if (isCreation && _defaultValueResolver.defaultValues.containsKey(id)) {
      final value = _getDefaultValue<TParam, T1, T2>(id);

      if (value == null) {
        safeAssign((value) => wrapper.optional(value), value);
      } else {
        // TODO(@melvspace): 03/08/25 research. Probably need to check real parameter nullability here. For safety field will be required now
        safeAssign((value) => wrapper.required(value), value);
      }
    }

    if (isCreation) {
      wrapper.completed.then((value) {
        if (!_initialValues.containsKey(id)) {
          _initialValues[id] = value;
        }
      });

      _added.add(id);
    }

    return wrapper;
  }

  T? _getDefaultValue<T, T1, T2>(String id) {
    return _defaultValueResolver.getDefaultValue<T, T1, T2>(id);
  }

  @override
  void updateDefaultValues(Map<String, dynamic> defaultValues) {
    _defaultValueResolver = DefaultValueResolver(
      params: this,
      defaultValues: defaultValues,
    );
  }

  @override
  void update<T>(String id, T value) {
    items[id]?.value = value;

    // TODO(@melvspace): 03/07/25 detect widget tree is building.
    Future.microtask(notifyListeners);
  }

  @override
  void reset() {
    for (final param in _params.entries) {
      if (!_initialValues.containsKey(param.key)) continue;

      final value = _initialValues[param.key];
      param.value.null$ = value == null;
      param.value.value = value;
    }

    notifyListeners();
  }

  // Methods

  Map<String, dynamic> serialize() {
    return _params.map(
      (key, value) => MapEntry(key, value.value),
    );
  }

  /// Updates state of notifier.
  ///
  /// Should be called after story loaded it's params.
  void deserialize(Map<String, dynamic> json) {
    for (final entry in json.entries) {
      update(entry.key, entry.value);
    }
  }

  // Types

  @override
  ParamWrapper<bool> boolean(String id) {
    return register<ParamWrapper<bool>, bool, void, void>(id);
  }

  @override
  ParamWrapper<String> string(String id) {
    return register<ParamWrapper<String>, String, void, void>(id);
  }

  @override
  ParamWrapper<double> number(String id) {
    return register<ParamWrapper<double>, double, void, void>(id);
  }

  @override
  ParamWrapper<int> integer(String id) {
    return register<ParamWrapper<int>, int, void, void>(id);
  }

  @override
  ParamWrapper<Color> color(String id) {
    return register<ParamWrapper<Color>, Color, void, void>(id);
  }

  @override
  ParamWrapper<Gradient> gradient(String id) {
    return register<ParamWrapper<Gradient>, Gradient, void, void>(id);
  }

  @override
  ParamWrapper<DateTime> datetime(String id) {
    return register<ParamWrapper<DateTime>, DateTime, void, void>(id);
  }

  @override
  ParamWrapper<Duration> duration(String id) {
    return register<ParamWrapper<Duration>, Duration, void, void>(id);
  }

  @override
  SingleChoiceParamWrapper<T> single<T>(String id, List<T> values) {
    return register<SingleChoiceParamWrapper<T>, T, void, void>(
      id,
      wrapperFactory: () => SingleChoiceParamWrapper(values: values),
    );
  }

  @override
  MultiChoiceParamWrapper<T> multi<T>(String id, List<T> values) {
    return register<MultiChoiceParamWrapper<T>, List<T>, void, void>(
      id,
      wrapperFactory: () => MultiChoiceParamWrapper(values: values),
    );
  }

  @override
  ParamWrapper<T> dynamic$<T, T1, T2>(String id) {
    return register<ParamWrapper<T>, T, T1, T2>(id);
  }

  @override
  T defaultFor<T>(ParamWrapper<T> param) {
    for (final builder in _builders) {
      if (builder.canBuild(param)) {
        return builder.getInitialValueFor(param);
      }
    }

    throw UnsupportedParamException(param);
  }
}
