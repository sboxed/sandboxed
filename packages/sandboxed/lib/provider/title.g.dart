// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'title.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(title)
const titleProvider = TitleProvider._();

final class TitleProvider extends $FunctionalProvider<Widget, Widget, Widget>
    with $Provider<Widget> {
  const TitleProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'titleProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$titleHash();

  @$internal
  @override
  $ProviderElement<Widget> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Widget create(Ref ref) {
    return title(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Widget value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Widget>(value),
    );
  }
}

String _$titleHash() => r'a44a0a9637dba258b13cd92879c1a2be744df0d3';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
