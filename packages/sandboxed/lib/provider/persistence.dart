import 'dart:async';

import 'package:flutter_riverpod/experimental/persist.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'persistence.g.dart';

@Riverpod(keepAlive: true)
Future<SharedPreferences> sharedPreferences(Ref ref) {
  return SharedPreferences.getInstance();
}

@riverpod
Future<Storage<String, String>> storage(Ref ref) async {
  final preferences = await ref.watch(sharedPreferencesProvider.future);

  return PreferencesStorage(preferences);
}

@Riverpod(keepAlive: true)
class PathPersistence extends _$PathPersistence {
  final _completer = Completer();
  late SharedPreferences _preferences;

  @override
  Future<String?> build() async {
    _preferences = await ref.watch(sharedPreferencesProvider.future);
    final value = _preferences.getString('path');

    _completer.complete(Future.microtask(() {}));

    return value;
  }

  Future<void> updatePath(String path) async {
    await _completer.future;
    _preferences.setString('path', path);
  }
}

final class PreferencesStorage extends Storage<String, String> {
  static const _kVersion = "1";
  static const _prefix = "sandboxed_storage";

  final SharedPreferences _preferences;

  PreferencesStorage(this._preferences);

  @override
  FutureOr<void> delete(String key) {
    if (key.endsWith(":expire_at") || key.endsWith(":destroy")) {
      throw ArgumentError.value(key, 'key', 'Cannot use reserved keys');
    }

    _preferences.remove("$_prefix:$key");
    _preferences.remove("$_prefix:$key:expire_at");
    _preferences.remove("$_prefix:$key:destroy");
  }

  @override
  void deleteOutOfDate() {}

  @override
  FutureOr<PersistedData<String>?> read(String key) {
    final value = _preferences.getString("$_prefix:$key");
    final destroyKey = _preferences.getString("$_prefix:$key:destroy");
    final expireAtString = _preferences.getString(
      "$_prefix:$key:expire_at",
    );

    if (value == null) return null;

    final expireAt = DateTime.tryParse(expireAtString ?? '');

    return PersistedData(
      value,
      destroyKey: destroyKey,
      expireAt: expireAt,
    );
  }

  @override
  FutureOr<void> write(String key, String value, StorageOptions options) {
    if (key.endsWith(":expire_at") || key.endsWith(":destroy")) {
      throw ArgumentError.value(key, 'key', 'Cannot use reserved keys');
    }

    _preferences.setString("$_prefix:$key", value);

    if (options.cacheTime.duration case Duration duration) {
      _preferences.setString(
        "$_prefix:$key:expire_at",
        DateTime.now().add(duration).toIso8601String(),
      );
    } else {
      _preferences.remove("$_prefix:$key:expire_at");
    }

    _preferences.setString(
      "$_prefix:$key:destroy",
      options.destroyKey ?? _kVersion,
    );
  }
}
