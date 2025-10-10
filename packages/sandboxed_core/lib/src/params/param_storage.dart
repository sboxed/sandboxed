import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sandboxed_core/sandboxed_core.dart';

class ParamStorage with ChangeNotifier {
  final StreamController<(String, ParamValue)> _paramRegisteredController =
      StreamController.broadcast();

  final Map<String, dynamic> _defaults = {};
  final Map<String, ParamValue> _registry = {};
  final List<ParamEditorFactory<Presenter>> _editors3;
  final DefaultResolver _defaultResolver;

  DefaultResolver get defaultResolver => _defaultResolver;

  Map<String, ParamValue> get items => {..._registry};

  Stream<(String, ParamValue)> get onParamRegistered =>
      _paramRegisteredController.stream;

  ParamStorage({
    List<ParamEditorFactory<Presenter>> editors3 = const [],
    DefaultResolver? defaultResolver,
  })  : _editors3 = editors3,
        _defaultResolver = defaultResolver ?? DefaultResolver.basic();

  void setInitialValues(Map<String, dynamic> defaults) {
    _defaults.addAll(defaults);
  }

  dynamic getInitialValue(String id) {
    return _defaults[id];
  }

  void register(String id, ParamValue value) {
    if (_registry.containsKey(id)) {
      throw StateError("param with id $id already registered");
    }

    _registry[id] = value;
    _paramRegisteredController.add((id, value));

    value.addListener(() => notify());

    notify();
  }

  ParamValue<T>? get<T>(String id) {
    return _registry[id] as ParamValue<T>?;
  }

  void update<T>(String id, T value) {
    _registry[id]?.update(value);
    notify();
  }

  void notify() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        notifyListeners();
      },
    );
  }

  void reset() {
    for (final param in _registry.entries) {
      param.value.reset();
    }
  }

  ValueEditorPresenter<T>? resolve<T>(ParamEditor<T>? editor) {
    if (editor == null) return null;

    final composite = _CompositeVisitor(_editors3);
    final result = editor.accept(composite) as ValueEditorPresenter<T>?;
    if (result != null) {
      return result;
    }

    return null;
  }

  @override
  void dispose() {
    _paramRegisteredController.close();

    super.dispose();
  }
}

// TODO(@melvspace): 10/12/25 refactor next code

typedef Presenter = ValueEditorPresenter<dynamic>?;

class _CompositeVisitor extends ParamEditorFactory<Presenter> {
  final List<ParamEditorFactory<Presenter>> _delegates;
  _CompositeVisitor(this._delegates);

  @override
  Presenter create<T>(ParamEditor<T> e) {
    for (final d in _delegates) {
      final r = e.accept(d);
      if (r != null) return r;
    }
    return null;
  }

  // Forward known editor kinds to delegates too
  @override
  Presenter createListEditor<TItem>(ListParamEditor<TItem> e) {
    for (final d in _delegates) {
      // Each delegate sees the real T here
      final r = d.createListEditor<TItem>(e);
      if (r != null) return r;
    }
    return null;
  }
}
