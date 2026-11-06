import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeModeNotifierProvider =
    NotifierProvider.autoDispose<ThemeModeNotifier, ThemeMode>(
  ThemeModeNotifier.new,
);

class ThemeModeNotifier extends Notifier<ThemeMode> {
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
