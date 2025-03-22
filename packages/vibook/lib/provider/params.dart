import 'package:flat/flat.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vibook/params/default_serializers.dart';
import 'package:vibook/params/param_serializer.dart';
import 'package:vibook/params/params_notifier.dart';
import 'package:vibook/provider/selected.dart';
import 'package:vibook/widgets/revive.dart';

part 'params.g.dart';

@Riverpod(dependencies: [SelectedElementNotifier])
String paramsScopeId(Ref ref) {
  return ref.watch(selectedElementNotifierProvider) ?? '';
}

@Riverpod(dependencies: [])
Raw<ParamsNotifier> params(Ref ref, String id) {
  return ParamsNotifier();
}

@riverpod
ParamSerializer serializer(Ref ref) {
  return ParamSerializer(
    delegates: kDefaultSerializers,
  );
}

@Riverpod(keepAlive: true, dependencies: [params])
class ParamsQuery extends _$ParamsQuery {
  late ParamSerializer _serializer;
  late ParamsNotifier _params;

  String _compute() {
    final state = <String, dynamic>{};
    for (final wrapper in _params.items.entries) {
      final data = _serializer.encode(wrapper.value, wrapper.value.rawValue);
      final initial = _serializer.encode(
        wrapper.value,
        wrapper.value.initialValue,
      );

      if (data == null && wrapper.value.initialValue == null) continue;
      if (data == initial) continue;

      state[wrapper.key] = data;
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
  String? build(String id) {
    _serializer = ref.watch(serializerProvider);
    _params = ref.watch(paramsProvider(id));

    _params.addListener(_update);
    ref.onDispose(() => _params.removeListener(_update));

    return _compute();
  }

  void applyDeeplink(String params) {
    final parts = params.split(';');
    final entries = parts.map(
      (e) {
        final [key, value] = e.split(':');
        return MapEntry(key, revive(value));
      },
    );

    final map = unflatten(Map.fromEntries(entries));

    for (final entry in map.entries) {
      final [id, value] = [entry.key, entry.value];
      final param = _params.items[id];

      if (param == null) {
        _params.onParamAdded.firstWhere((element) => element == id).then(
          (_) {
            final param = _params.items[id];
            if (param == null) return;

            final data = _serializer.decode(param, value);
            _params.update(id, data);
          },
        );
      } else {
        final data = _serializer.decode(param, value);
        _params.update(id, data);
      }
    }

    state = params;
    ref.notifyListeners();
  }
}
