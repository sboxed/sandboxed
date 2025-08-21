import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'persistence.g.dart';

@Riverpod(keepAlive: true)
Future<SharedPreferences> sharedPreferences(Ref ref) {
  return SharedPreferences.getInstance();
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
