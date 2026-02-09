// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tags.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(globalTags)
final globalTagsProvider = GlobalTagsProvider._();

final class GlobalTagsProvider
    extends $FunctionalProvider<Set<String>, Set<String>, Set<String>>
    with $Provider<Set<String>> {
  GlobalTagsProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'globalTagsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$globalTagsHash();

  @$internal
  @override
  $ProviderElement<Set<String>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Set<String> create(Ref ref) {
    return globalTags(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Set<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Set<String>>(value),
    );
  }
}

String _$globalTagsHash() => r'a761c15eab6639493eaa603906ec36f2efed7f9e';

@ProviderFor(tagsResolver)
final tagsResolverProvider = TagsResolverProvider._();

final class TagsResolverProvider
    extends $FunctionalProvider<TagsResolver, TagsResolver, TagsResolver>
    with $Provider<TagsResolver> {
  TagsResolverProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'tagsResolverProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$tagsResolverHash();

  @$internal
  @override
  $ProviderElement<TagsResolver> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TagsResolver create(Ref ref) {
    return tagsResolver(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TagsResolver value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TagsResolver>(value),
    );
  }
}

String _$tagsResolverHash() => r'c96b74a7ce32657b5d62d093329324c90e849d3b';

@ProviderFor(allTags)
final allTagsProvider = AllTagsProvider._();

final class AllTagsProvider
    extends $FunctionalProvider<Set<String>, Set<String>, Set<String>>
    with $Provider<Set<String>> {
  AllTagsProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'allTagsProvider',
          isAutoDispose: true,
          dependencies: <ProviderOrFamily>[componentsProvider],
          $allTransitiveDependencies: <ProviderOrFamily>[
            AllTagsProvider.$allTransitiveDependencies0,
          ],
        );

  static final $allTransitiveDependencies0 = componentsProvider;

  @override
  String debugGetCreateSourceHash() => _$allTagsHash();

  @$internal
  @override
  $ProviderElement<Set<String>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Set<String> create(Ref ref) {
    return allTags(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Set<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Set<String>>(value),
    );
  }
}

String _$allTagsHash() => r'58a1494b1433703053abf544b48c507a3a2b1de3';

@ProviderFor(TagFilter)
final tagFilterProvider = TagFilterProvider._();

final class TagFilterProvider
    extends $NotifierProvider<TagFilter, Set<String>> {
  TagFilterProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'tagFilterProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$tagFilterHash();

  @$internal
  @override
  TagFilter create() => TagFilter();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Set<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Set<String>>(value),
    );
  }
}

String _$tagFilterHash() => r'4a5996dc7fbfc14cc0e1e742d77199e47e9391fc';

abstract class _$TagFilter extends $Notifier<Set<String>> {
  Set<String> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<Set<String>, Set<String>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<Set<String>, Set<String>>, Set<String>, Object?, Object?>;
    element.handleCreate(ref, build);
  }
}
