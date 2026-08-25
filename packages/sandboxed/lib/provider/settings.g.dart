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
