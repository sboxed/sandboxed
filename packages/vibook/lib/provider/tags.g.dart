// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tags.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$globalTagsHash() => r'a761c15eab6639493eaa603906ec36f2efed7f9e';

/// See also [globalTags].
@ProviderFor(globalTags)
final globalTagsProvider = AutoDisposeProvider<Set<String>>.internal(
  globalTags,
  name: r'globalTagsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$globalTagsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GlobalTagsRef = AutoDisposeProviderRef<Set<String>>;
String _$tagsResolverHash() => r'c96b74a7ce32657b5d62d093329324c90e849d3b';

/// See also [tagsResolver].
@ProviderFor(tagsResolver)
final tagsResolverProvider = AutoDisposeProvider<TagsResolver>.internal(
  tagsResolver,
  name: r'tagsResolverProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$tagsResolverHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TagsResolverRef = AutoDisposeProviderRef<TagsResolver>;
String _$allTagsHash() => r'58a1494b1433703053abf544b48c507a3a2b1de3';

/// See also [allTags].
@ProviderFor(allTags)
final allTagsProvider = AutoDisposeProvider<Set<String>>.internal(
  allTags,
  name: r'allTagsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$allTagsHash,
  dependencies: <ProviderOrFamily>[componentsProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    componentsProvider,
    ...?componentsProvider.allTransitiveDependencies
  },
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AllTagsRef = AutoDisposeProviderRef<Set<String>>;
String _$tagFilterHash() => r'4a5996dc7fbfc14cc0e1e742d77199e47e9391fc';

/// See also [TagFilter].
@ProviderFor(TagFilter)
final tagFilterProvider =
    AutoDisposeNotifierProvider<TagFilter, Set<String>>.internal(
  TagFilter.new,
  name: r'tagFilterProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$tagFilterHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TagFilter = AutoDisposeNotifier<Set<String>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
