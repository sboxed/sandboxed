import 'package:flat/flat.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sandboxed/addons/mixins/param_editor_addon.dart';
import 'package:sandboxed/provider/addons.dart';
import 'package:sandboxed/provider/selected.dart';
import 'package:sandboxed/utility/debouncer.dart';
import 'package:sandboxed/widgets/revive.dart';
import 'package:sandboxed_core/sandboxed_core.dart';

part 'params.g.dart';

@Riverpod(dependencies: [SelectedElementNotifier])
String paramsScopeId(Ref ref) {
  return ref.watch(selectedElementNotifierProvider) ?? '';
}

@Riverpod(dependencies: [Addons])
Raw<ParamStorage> params(Ref ref, String id) {
  final addons = ref.watch(addonsProvider);

  final editors3 = addons //
      .whereType<ParamEditorAddon>()
      .map((addon) => addon.editors3)
      .expand((element) => element)
      .toList();

  return ParamStorage(editors3: editors3);
}

@Riverpod(keepAlive: true, dependencies: [params])
class ParamsQuery extends _$ParamsQuery {
  late ParamStorage _params;
  final Debouncer _debouncer = Debouncer(
    duration: Duration(milliseconds: 500),
  );

  String _compute() {
    final state = <String, dynamic>{};
    for (final wrapper in _params.items.entries) {
      final serializer = wrapper.value.serializer;
      if (serializer == null) continue;
      if (!wrapper.value.changed) continue;

      dynamic data;
      try {
        data = serializer.$serialize(wrapper.value.value);
      } catch (e) {
        if (kDebugMode) {
          print(e.toString());
        }
      }

      if (data == null) continue;
      final invalid = validate(data);
      if (invalid.isNotEmpty) {
        if (kDebugMode) {
          print(
              "WARNING: param ${wrapper.key} contains illegal characters in serialized form");
          print("\t${invalid.join("\n\t")}");
        }
        continue;
      }

      state[wrapper.key] = data;
    }

    final query = flatten(state) //
        .entries
        .map((e) => '${e.key}:${e.value}')
        .join(';');

    return query;
  }

  void _update() {
    _debouncer.debounce(() {
      if (!ref.mounted) return;

      state = _compute();
      ref.notifyListeners();
    });
  }

  @override
  String? build(String id) {
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
        _params.onParamRegistered.firstWhere((it) => it.$1 == id).then(
          (_) {
            final param = _params.items[id];
            if (param == null) return;

            final serializer = param.serializer;
            if (serializer == null) return;

            final data = serializer.$deserialize(value);
            _params.update(id, data);
          },
        );
      } else {
        final serializer = param.serializer;
        if (serializer == null) return;

        final data = serializer.$deserialize(value);
        _params.update(id, data);
      }
    }

    state = params;
    ref.notifyListeners();
  }
}

List<String> validate(dynamic data) {
  switch (data) {
    case Map<String, dynamic> map:
      return flatten(map)
          .values
          .whereType<String>()
          .where((it) => it.contains(RegExp(r'[:;]')))
          .toList();

    case List list:
      return list //
          .map((it) => validate(it))
          .expand((it) => it)
          .toList();

    case String string:
      if (string.contains(RegExp(r'[:;]'))) {
        return [string];
      }

      return [];

    default:
      return [];
  }
}
