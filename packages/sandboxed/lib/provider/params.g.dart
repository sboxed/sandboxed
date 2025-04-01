// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'params.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$paramsScopeIdHash() => r'84f5764839e00fba92207393cad65c1b5fe4d362';

/// See also [paramsScopeId].
@ProviderFor(paramsScopeId)
final paramsScopeIdProvider = AutoDisposeProvider<String>.internal(
  paramsScopeId,
  name: r'paramsScopeIdProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$paramsScopeIdHash,
  dependencies: <ProviderOrFamily>[selectedElementNotifierProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    selectedElementNotifierProvider,
    ...?selectedElementNotifierProvider.allTransitiveDependencies
  },
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ParamsScopeIdRef = AutoDisposeProviderRef<String>;
String _$paramsHash() => r'a1e9b06d01ac0977c3bf5f0efe5babadfff354c8';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [params].
@ProviderFor(params)
const paramsProvider = ParamsFamily();

/// See also [params].
class ParamsFamily extends Family<Raw<ParamsNotifier>> {
  /// See also [params].
  const ParamsFamily();

  /// See also [params].
  ParamsProvider call(
    String id,
  ) {
    return ParamsProvider(
      id,
    );
  }

  @override
  ParamsProvider getProviderOverride(
    covariant ParamsProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static final Iterable<ProviderOrFamily> _dependencies = <ProviderOrFamily>[
    addonsProvider
  ];

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static final Iterable<ProviderOrFamily> _allTransitiveDependencies =
      <ProviderOrFamily>{
    addonsProvider,
    ...?addonsProvider.allTransitiveDependencies
  };

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'paramsProvider';
}

/// See also [params].
class ParamsProvider extends AutoDisposeProvider<Raw<ParamsNotifier>> {
  /// See also [params].
  ParamsProvider(
    String id,
  ) : this._internal(
          (ref) => params(
            ref as ParamsRef,
            id,
          ),
          from: paramsProvider,
          name: r'paramsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$paramsHash,
          dependencies: ParamsFamily._dependencies,
          allTransitiveDependencies: ParamsFamily._allTransitiveDependencies,
          id: id,
        );

  ParamsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    Raw<ParamsNotifier> Function(ParamsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ParamsProvider._internal(
        (ref) => create(ref as ParamsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<Raw<ParamsNotifier>> createElement() {
    return _ParamsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ParamsProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ParamsRef on AutoDisposeProviderRef<Raw<ParamsNotifier>> {
  /// The parameter `id` of this provider.
  String get id;
}

class _ParamsProviderElement
    extends AutoDisposeProviderElement<Raw<ParamsNotifier>> with ParamsRef {
  _ParamsProviderElement(super.provider);

  @override
  String get id => (origin as ParamsProvider).id;
}

String _$serializerHash() => r'ae392afe85818da319ab04d4c1830ae1544181c3';

/// See also [serializer].
@ProviderFor(serializer)
final serializerProvider = AutoDisposeProvider<ParamSerializer>.internal(
  serializer,
  name: r'serializerProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$serializerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SerializerRef = AutoDisposeProviderRef<ParamSerializer>;
String _$paramsQueryHash() => r'299fda81b36b21a421aa54b5238240742da92c3a';

abstract class _$ParamsQuery extends BuildlessNotifier<String?> {
  late final String id;

  String? build(
    String id,
  );
}

/// See also [ParamsQuery].
@ProviderFor(ParamsQuery)
const paramsQueryProvider = ParamsQueryFamily();

/// See also [ParamsQuery].
class ParamsQueryFamily extends Family<String?> {
  /// See also [ParamsQuery].
  const ParamsQueryFamily();

  /// See also [ParamsQuery].
  ParamsQueryProvider call(
    String id,
  ) {
    return ParamsQueryProvider(
      id,
    );
  }

  @override
  ParamsQueryProvider getProviderOverride(
    covariant ParamsQueryProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static final Iterable<ProviderOrFamily> _dependencies = <ProviderOrFamily>[
    paramsProvider
  ];

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static final Iterable<ProviderOrFamily> _allTransitiveDependencies =
      <ProviderOrFamily>{
    paramsProvider,
    ...?paramsProvider.allTransitiveDependencies
  };

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'paramsQueryProvider';
}

/// See also [ParamsQuery].
class ParamsQueryProvider extends NotifierProviderImpl<ParamsQuery, String?> {
  /// See also [ParamsQuery].
  ParamsQueryProvider(
    String id,
  ) : this._internal(
          () => ParamsQuery()..id = id,
          from: paramsQueryProvider,
          name: r'paramsQueryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$paramsQueryHash,
          dependencies: ParamsQueryFamily._dependencies,
          allTransitiveDependencies:
              ParamsQueryFamily._allTransitiveDependencies,
          id: id,
        );

  ParamsQueryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  String? runNotifierBuild(
    covariant ParamsQuery notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(ParamsQuery Function() create) {
    return ProviderOverride(
      origin: this,
      override: ParamsQueryProvider._internal(
        () => create()..id = id,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  NotifierProviderElement<ParamsQuery, String?> createElement() {
    return _ParamsQueryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ParamsQueryProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ParamsQueryRef on NotifierProviderRef<String?> {
  /// The parameter `id` of this provider.
  String get id;
}

class _ParamsQueryProviderElement
    extends NotifierProviderElement<ParamsQuery, String?> with ParamsQueryRef {
  _ParamsQueryProviderElement(super.provider);

  @override
  String get id => (origin as ParamsQueryProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
