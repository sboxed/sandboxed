// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$selectionHash() => r'bbe0f5f83efb158b1a0e6b55656dc2cf1ad1e393';

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

/// See also [selection].
@ProviderFor(selection)
const selectionProvider = SelectionFamily();

/// See also [selection].
class SelectionFamily extends Family<Selection?> {
  /// See also [selection].
  const SelectionFamily();

  /// See also [selection].
  SelectionProvider call(
    String id,
  ) {
    return SelectionProvider(
      id,
    );
  }

  @override
  SelectionProvider getProviderOverride(
    covariant SelectionProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static final Iterable<ProviderOrFamily> _dependencies = <ProviderOrFamily>[
    nodeProvider
  ];

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static final Iterable<ProviderOrFamily> _allTransitiveDependencies =
      <ProviderOrFamily>{
    nodeProvider,
    ...?nodeProvider.allTransitiveDependencies
  };

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'selectionProvider';
}

/// See also [selection].
class SelectionProvider extends AutoDisposeProvider<Selection?> {
  /// See also [selection].
  SelectionProvider(
    String id,
  ) : this._internal(
          (ref) => selection(
            ref as SelectionRef,
            id,
          ),
          from: selectionProvider,
          name: r'selectionProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$selectionHash,
          dependencies: SelectionFamily._dependencies,
          allTransitiveDependencies: SelectionFamily._allTransitiveDependencies,
          id: id,
        );

  SelectionProvider._internal(
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
    Selection? Function(SelectionRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SelectionProvider._internal(
        (ref) => create(ref as SelectionRef),
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
  AutoDisposeProviderElement<Selection?> createElement() {
    return _SelectionProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SelectionProvider && other.id == id;
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
mixin SelectionRef on AutoDisposeProviderRef<Selection?> {
  /// The parameter `id` of this provider.
  String get id;
}

class _SelectionProviderElement extends AutoDisposeProviderElement<Selection?>
    with SelectionRef {
  _SelectionProviderElement(super.provider);

  @override
  String get id => (origin as SelectionProvider).id;
}

String _$selectedElementHash() => r'5100ef9135f30789202557e4d1c87147909f0e2c';

/// See also [selectedElement].
@ProviderFor(selectedElement)
final selectedElementProvider = AutoDisposeProvider<Selection?>.internal(
  selectedElement,
  name: r'selectedElementProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectedElementHash,
  dependencies: <ProviderOrFamily>[
    selectionProvider,
    selectedElementNotifierProvider
  ],
  allTransitiveDependencies: <ProviderOrFamily>{
    selectionProvider,
    ...?selectionProvider.allTransitiveDependencies,
    selectedElementNotifierProvider,
    ...?selectedElementNotifierProvider.allTransitiveDependencies
  },
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SelectedElementRef = AutoDisposeProviderRef<Selection?>;
String _$selectedElementNotifierHash() =>
    r'04f4161447c22efb82eea3a274ba35a8d1aedc58';

/// See also [SelectedElementNotifier].
@ProviderFor(SelectedElementNotifier)
final selectedElementNotifierProvider =
    NotifierProvider<SelectedElementNotifier, String?>.internal(
  SelectedElementNotifier.new,
  name: r'selectedElementNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectedElementNotifierHash,
  dependencies: const <ProviderOrFamily>[],
  allTransitiveDependencies: const <ProviderOrFamily>{},
);

typedef _$SelectedElementNotifier = Notifier<String?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
