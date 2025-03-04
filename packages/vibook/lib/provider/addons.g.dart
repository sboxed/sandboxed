// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addons.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$addonListHash() => r'8a948dbad4c5cb6af18d44af56bd20c2be654854';

/// See also [addonList].
@ProviderFor(addonList)
final addonListProvider = AutoDisposeProvider<List<Addon>>.internal(
  addonList,
  name: r'addonListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$addonListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AddonListRef = AutoDisposeProviderRef<List<Addon>>;
String _$addonsHash() => r'540828b2f4ca145ea4452eb73f8ce4a84324149a';

/// See also [Addons].
@ProviderFor(Addons)
final addonsProvider =
    AutoDisposeNotifierProvider<Addons, List<Addon>>.internal(
  Addons.new,
  name: r'addonsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$addonsHash,
  dependencies: <ProviderOrFamily>[addonListProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    addonListProvider,
    ...?addonListProvider.allTransitiveDependencies
  },
);

typedef _$Addons = AutoDisposeNotifier<List<Addon>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
