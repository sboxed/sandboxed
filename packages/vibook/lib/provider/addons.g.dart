// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addons.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$addonListHash() => r'ea82c6dbc93ecd4dccbedeb7c0142cee81a75b43';

/// See also [addonList].
@ProviderFor(addonList)
final addonListProvider = AutoDisposeProvider<List<Addon>>.internal(
  addonList,
  name: r'addonListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$addonListHash,
  dependencies: const <ProviderOrFamily>[],
  allTransitiveDependencies: const <ProviderOrFamily>{},
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AddonListRef = AutoDisposeProviderRef<List<Addon>>;
String _$addonsHash() => r'f00bb36db2c6798f937506f55cdc4624c9a72e3f';

/// See also [Addons].
@ProviderFor(Addons)
final addonsProvider = NotifierProvider<Addons, List<Addon>>.internal(
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

typedef _$Addons = Notifier<List<Addon>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
