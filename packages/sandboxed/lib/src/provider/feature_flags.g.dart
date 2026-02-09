// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feature_flags.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(featureFlags)
final featureFlagsProvider = FeatureFlagsProvider._();

final class FeatureFlagsProvider extends $FunctionalProvider<Set<FeatureFlags>,
    Set<FeatureFlags>, Set<FeatureFlags>> with $Provider<Set<FeatureFlags>> {
  FeatureFlagsProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'featureFlagsProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$featureFlagsHash();

  @$internal
  @override
  $ProviderElement<Set<FeatureFlags>> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Set<FeatureFlags> create(Ref ref) {
    return featureFlags(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Set<FeatureFlags> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Set<FeatureFlags>>(value),
    );
  }
}

String _$featureFlagsHash() => r'dceba84f1999581365e614999257773dc5b4e6d0';
