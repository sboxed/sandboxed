// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feature_flags.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(featureFlags)
const featureFlagsProvider = FeatureFlagsProvider._();

final class FeatureFlagsProvider extends $FunctionalProvider<Set<FeatureFlags>,
    Set<FeatureFlags>, Set<FeatureFlags>> with $Provider<Set<FeatureFlags>> {
  const FeatureFlagsProvider._()
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

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
