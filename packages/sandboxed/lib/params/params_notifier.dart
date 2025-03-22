// ignore_for_file: implementation_imports

import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sandboxed_core/src/params/use_params.dart';
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
  final Map<String, dynamic> _defaultValues = {};
  final Map<String, dynamic> _initialValues = {};

  Map<String, ParamWrapper> get items => UnmodifiableMapView(_params);

  final PublishSubject<String> _added = PublishSubject();
  Stream<String> get onParamAdded => _added;

  TWrapper register<TWrapper extends ParamWrapper<TParam>, TParam>(
    String id, {
    TWrapper Function()? wrapperFactory,
  }) {
    var isCreation = !_params.containsKey(id);
    final wrapper = _params.putIfAbsent(
      id,
      () => wrapperFactory?.call() ?? ParamWrapper<TParam>(),
    ) as TWrapper;

    if (isCreation && _defaultValues.containsKey(id)) {
      final value = switch (_defaultValues[id]) {
        // TODO(@melvspace): 03/09/25 link param wrappers to update each other
        UseParams useParams => useParams.builder(this),
        var value => value,
      };

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

  @override
  void updateDefaultValues(Map<String, dynamic> defaultValues) {
    _defaultValues.clear();
    _defaultValues.addAll(defaultValues);
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
    return register<ParamWrapper<bool>, bool>(id);
  }

  @override
  ParamWrapper<String> string(String id) {
    return register<ParamWrapper<String>, String>(id);
  }

  @override
  ParamWrapper<double> number(String id) {
    return register<ParamWrapper<double>, double>(id);
  }

  @override
  ParamWrapper<int> integer(String id) {
    return register<ParamWrapper<int>, int>(id);
  }

  @override
  ParamWrapper<Color> color(String id) {
    return register<ParamWrapper<Color>, Color>(id);
  }

  @override
  ParamWrapper<Gradient> gradient(String id) {
    return register<ParamWrapper<Gradient>, Gradient>(id);
  }

  @override
  ParamWrapper<DateTime> datetime(String id) {
    return register<ParamWrapper<DateTime>, DateTime>(id);
  }

  @override
  ParamWrapper<Duration> duration(String id) {
    return register<ParamWrapper<Duration>, Duration>(id);
  }

  @override
  SingleChoiceParamWrapper<T> single<T>(String id, List<T> values) {
    return register<SingleChoiceParamWrapper<T>, T>(
      id,
      wrapperFactory: () => SingleChoiceParamWrapper(values: values),
    );
  }

  @override
  MultiChoiceParamWrapper<T> multi<T>(String id, List<T> values) {
    return register<MultiChoiceParamWrapper<T>, List<T>>(
      id,
      wrapperFactory: () => MultiChoiceParamWrapper(values: values),
    );
  }

  @override
  ParamWrapper<T> dynamic$<T>(String id) {
    return register<ParamWrapper<T>, T>(id);
  }
}
