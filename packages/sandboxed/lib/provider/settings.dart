import 'package:flutter_riverpod/experimental/persist.dart';
import 'package:riverpod_annotation/experimental/json_persist.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sandboxed/provider/persistence.dart';

part 'settings.freezed.dart';
part 'settings.g.dart';

@freezed
abstract class Settings with _$Settings {
  const factory Settings({
    required double? interfaceScale,
    required bool denseExplorer,
  }) = _Settings;

  factory Settings.fromJson(Map<String, dynamic> json) =>
      _$SettingsFromJson(json);
}

@riverpod
@JsonPersist()
class SettingStorage extends _$SettingStorage {
  @override
  Settings build() {
    persist(
      ref.watch(storageProvider.future),
      options: StorageOptions(cacheTime: StorageCacheTime.unsafe_forever),
    );

    return const Settings(
      interfaceScale: null,
      denseExplorer: false,
    );
  }

  void update(Settings Function(Settings current) update) {
    state = update(state);
  }
}
