// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addons.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(addonList)
const addonListProvider = AddonListProvider._();

final class AddonListProvider
    extends $FunctionalProvider<List<Addon>, List<Addon>, List<Addon>>
    with $Provider<List<Addon>> {
  const AddonListProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'addonListProvider',
          isAutoDispose: true,
          dependencies: const <ProviderOrFamily>[],
          $allTransitiveDependencies: const <ProviderOrFamily>[],
        );

  @override
  String debugGetCreateSourceHash() => _$addonListHash();

  @$internal
  @override
  $ProviderElement<List<Addon>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<Addon> create(Ref ref) {
    return addonList(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Addon> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Addon>>(value),
    );
  }
}

String _$addonListHash() => r'ea82c6dbc93ecd4dccbedeb7c0142cee81a75b43';

@ProviderFor(Addons)
const addonsProvider = AddonsProvider._();

final class AddonsProvider extends $NotifierProvider<Addons, List<Addon>> {
  const AddonsProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'addonsProvider',
          isAutoDispose: false,
          dependencies: const <ProviderOrFamily>[addonListProvider],
          $allTransitiveDependencies: const <ProviderOrFamily>[
            AddonsProvider.$allTransitiveDependencies0,
          ],
        );

  static const $allTransitiveDependencies0 = addonListProvider;

  @override
  String debugGetCreateSourceHash() => _$addonsHash();

  @$internal
  @override
  Addons create() => Addons();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Addon> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Addon>>(value),
    );
  }
}

String _$addonsHash() => r'f00bb36db2c6798f937506f55cdc4624c9a72e3f';

abstract class _$Addons extends $Notifier<List<Addon>> {
  List<Addon> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<Addon>, List<Addon>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<List<Addon>, List<Addon>>, List<Addon>, Object?, Object?>;
    element.handleValue(ref, created);
  }
}

@ProviderFor(AddonQuery)
const addonQueryProvider = AddonQueryProvider._();

final class AddonQueryProvider extends $NotifierProvider<AddonQuery, String?> {
  const AddonQueryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'addonQueryProvider',
          isAutoDispose: false,
          dependencies: const <ProviderOrFamily>[addonsProvider],
          $allTransitiveDependencies: const <ProviderOrFamily>[
            AddonQueryProvider.$allTransitiveDependencies0,
            AddonQueryProvider.$allTransitiveDependencies1,
          ],
        );

  static const $allTransitiveDependencies0 = addonsProvider;
  static const $allTransitiveDependencies1 =
      AddonsProvider.$allTransitiveDependencies0;

  @override
  String debugGetCreateSourceHash() => _$addonQueryHash();

  @$internal
  @override
  AddonQuery create() => AddonQuery();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String?>(value),
    );
  }
}

String _$addonQueryHash() => r'd7b592b25b1bd4a40103627ea23cd01afc908810';

abstract class _$AddonQuery extends $Notifier<String?> {
  String? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<String?, String?>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<String?, String?>, String?, Object?, Object?>;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
