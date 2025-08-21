// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brand_color.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(brandColor)
const brandColorProvider = BrandColorProvider._();

final class BrandColorProvider extends $FunctionalProvider<Color, Color, Color>
    with $Provider<Color> {
  const BrandColorProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'brandColorProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$brandColorHash();

  @$internal
  @override
  $ProviderElement<Color> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Color create(Ref ref) {
    return brandColor(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Color value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Color>(value),
    );
  }
}

String _$brandColorHash() => r'a5de268264ddadec44e0fca4ade1ddb58823b32e';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
