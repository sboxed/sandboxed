import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_mode.g.dart';

@riverpod
class ThemeModeNotifier extends _$ThemeModeNotifier {
  @override
  ThemeMode build() {
    return ThemeMode.system;
  }

  void next() {
    var index = ThemeMode.values.indexOf(state);
    state = ThemeMode.values[(index + 1) % ThemeMode.values.length];
    ref.notifyListeners();
  }
}
