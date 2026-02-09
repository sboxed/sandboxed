// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Settings _$SettingsFromJson(Map<String, dynamic> json) => _Settings(
      interfaceScale: (json['interfaceScale'] as num?)?.toDouble(),
      denseExplorer: json['denseExplorer'] as bool,
      optInFeatures: (json['optInFeatures'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$FeatureFlagsEnumMap, e))
              .toSet() ??
          const <FeatureFlags>{},
      positions: (json['positions'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, $enumDecode(_$PanelPositionEnumMap, e)),
          ) ??
          const <String, PanelPosition>{},
    );

Map<String, dynamic> _$SettingsToJson(_Settings instance) => <String, dynamic>{
      'interfaceScale': instance.interfaceScale,
      'denseExplorer': instance.denseExplorer,
      'optInFeatures':
          instance.optInFeatures.map((e) => _$FeatureFlagsEnumMap[e]!).toList(),
      'positions': instance.positions
          .map((k, e) => MapEntry(k, _$PanelPositionEnumMap[e]!)),
    };

const _$FeatureFlagsEnumMap = {
  FeatureFlags.elementTreeNext: 'elementTreeNext',
};

const _$PanelPositionEnumMap = {
  PanelPosition.bottom: 'bottom',
  PanelPosition.right: 'right',
};

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SettingStorage)
@JsonPersist()
final settingStorageProvider = SettingStorageProvider._();

@JsonPersist()
final class SettingStorageProvider
    extends $NotifierProvider<SettingStorage, Settings> {
  SettingStorageProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'settingStorageProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$settingStorageHash();

  @$internal
  @override
  SettingStorage create() => SettingStorage();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Settings value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Settings>(value),
    );
  }
}

String _$settingStorageHash() => r'7fb91d299f84104e4df5a19021d7b2072e3534f2';

@JsonPersist()
abstract class _$SettingStorageBase extends $Notifier<Settings> {
  Settings build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<Settings, Settings>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<Settings, Settings>, Settings, Object?, Object?>;
    element.handleCreate(ref, build);
  }
}

// **************************************************************************
// JsonGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
abstract class _$SettingStorage extends _$SettingStorageBase {
  /// The default key used by [persist].
  String get key {
    const resolvedKey = "SettingStorage";
    return resolvedKey;
  }

  /// A variant of [persist], for JSON-specific encoding.
  ///
  /// You can override [key] to customize the key used for storage.
  PersistResult persist(
    FutureOr<Storage<String, String>> storage, {
    String? key,
    String Function(Settings state)? encode,
    Settings Function(String encoded)? decode,
    StorageOptions options = const StorageOptions(),
  }) {
    return NotifierPersistX(this).persist<String, String>(
      storage,
      key: key ?? this.key,
      encode: encode ?? $jsonCodex.encode,
      decode: decode ??
          (encoded) {
            final e = $jsonCodex.decode(encoded);
            return Settings.fromJson(e as Map<String, Object?>);
          },
      options: options,
    );
  }
}
