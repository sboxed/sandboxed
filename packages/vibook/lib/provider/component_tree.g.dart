// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'component_tree.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$componentsHash() => r'3c33b0445435aa3cec6ceb7478dc8dc2295b4cdc';

/// See also [components].
@ProviderFor(components)
final componentsProvider = AutoDisposeProvider<List<Component>>.internal(
  components,
  name: r'componentsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$componentsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ComponentsRef = AutoDisposeProviderRef<List<Component>>;
String _$componentTreeNotifierHash() =>
    r'b319af994f1c7db58ea40ec7a5862d72277c166f';

/// See also [ComponentTreeNotifier].
@ProviderFor(ComponentTreeNotifier)
final componentTreeNotifierProvider = NotifierProvider<ComponentTreeNotifier,
    TreeType<AbstractComponentTreeNode>>.internal(
  ComponentTreeNotifier.new,
  name: r'componentTreeNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$componentTreeNotifierHash,
  dependencies: <ProviderOrFamily>[componentsProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    componentsProvider,
    ...?componentsProvider.allTransitiveDependencies
  },
);

typedef _$ComponentTreeNotifier = Notifier<TreeType<AbstractComponentTreeNode>>;
String _$nodeHash() => r'698455fc12833d7525dbc17e37f01d60ded47813';

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

abstract class _$Node extends BuildlessAutoDisposeNotifier<Tree?> {
  late final String? id;

  Tree? build(
    String? id,
  );
}

/// See also [Node].
@ProviderFor(Node)
const nodeProvider = NodeFamily();

/// See also [Node].
class NodeFamily extends Family<Tree?> {
  /// See also [Node].
  const NodeFamily();

  /// See also [Node].
  NodeProvider call(
    String? id,
  ) {
    return NodeProvider(
      id,
    );
  }

  @override
  NodeProvider getProviderOverride(
    covariant NodeProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'nodeProvider';
}

/// See also [Node].
class NodeProvider extends AutoDisposeNotifierProviderImpl<Node, Tree?> {
  /// See also [Node].
  NodeProvider(
    String? id,
  ) : this._internal(
          () => Node()..id = id,
          from: nodeProvider,
          name: r'nodeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product') ? null : _$nodeHash,
          dependencies: NodeFamily._dependencies,
          allTransitiveDependencies: NodeFamily._allTransitiveDependencies,
          id: id,
        );

  NodeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String? id;

  @override
  Tree? runNotifierBuild(
    covariant Node notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(Node Function() create) {
    return ProviderOverride(
      origin: this,
      override: NodeProvider._internal(
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
  AutoDisposeNotifierProviderElement<Node, Tree?> createElement() {
    return _NodeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is NodeProvider && other.id == id;
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
mixin NodeRef on AutoDisposeNotifierProviderRef<Tree?> {
  /// The parameter `id` of this provider.
  String? get id;
}

class _NodeProviderElement
    extends AutoDisposeNotifierProviderElement<Node, Tree?> with NodeRef {
  _NodeProviderElement(super.provider);

  @override
  String? get id => (origin as NodeProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
