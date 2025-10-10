// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'persistence.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(sharedPreferences)
const sharedPreferencesProvider = SharedPreferencesProvider._();

final class SharedPreferencesProvider extends $FunctionalProvider<
        AsyncValue<SharedPreferences>,
        SharedPreferences,
        FutureOr<SharedPreferences>>
    with
        $FutureModifier<SharedPreferences>,
        $FutureProvider<SharedPreferences> {
  const SharedPreferencesProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'sharedPreferencesProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$sharedPreferencesHash();

  @$internal
  @override
  $FutureProviderElement<SharedPreferences> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<SharedPreferences> create(Ref ref) {
    return sharedPreferences(ref);
  }
}

String _$sharedPreferencesHash() => r'48e60558ea6530114ea20ea03e69b9fb339ab129';

@ProviderFor(PathPersistence)
const pathPersistenceProvider = PathPersistenceProvider._();

final class PathPersistenceProvider
    extends $AsyncNotifierProvider<PathPersistence, String?> {
  const PathPersistenceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'pathPersistenceProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$pathPersistenceHash();

  @$internal
  @override
  PathPersistence create() => PathPersistence();
}

String _$pathPersistenceHash() => r'67b23da3d3903bfbec5d7f2e9fb2e38d182c234e';

abstract class _$PathPersistence extends $AsyncNotifier<String?> {
  FutureOr<String?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<String?>, String?>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<String?>, String?>,
        AsyncValue<String?>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
