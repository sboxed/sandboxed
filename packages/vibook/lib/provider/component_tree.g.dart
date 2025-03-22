// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'component_tree.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$componentsHash() => r'feec9fa6d48892659f67228ea0f8c41dc0e445ac';

/// See also [components].
@ProviderFor(components)
final componentsProvider = AutoDisposeProvider<List<ViElement>>.internal(
  components,
  name: r'componentsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$componentsHash,
  dependencies: const <ProviderOrFamily>[],
  allTransitiveDependencies: const <ProviderOrFamily>{},
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ComponentsRef = AutoDisposeProviderRef<List<ViElement>>;
String _$filteredTreeHash() => r'd53650f8dbdcb5ec926fc79154de1d5d31bfd591';

/// See also [filteredTree].
@ProviderFor(filteredTree)
final filteredTreeProvider = AutoDisposeProvider<Tree?>.internal(
  filteredTree,
  name: r'filteredTreeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$filteredTreeHash,
  dependencies: <ProviderOrFamily>[componentTreeNotifierProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    componentTreeNotifierProvider,
    ...?componentTreeNotifierProvider.allTransitiveDependencies
  },
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FilteredTreeRef = AutoDisposeProviderRef<Tree?>;
String _$tree2Hash() => r'9fd9eaccf00606e449edac6e8049dac53ef2d14c';

/// See also [tree2].
@ProviderFor(tree2)
final tree2Provider =
    AutoDisposeProvider<List<TreeViewNode<ElementNode>>>.internal(
  tree2,
  name: r'tree2Provider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$tree2Hash,
  dependencies: <ProviderOrFamily>[componentTreeNotifierProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    componentTreeNotifierProvider,
    ...?componentTreeNotifierProvider.allTransitiveDependencies
  },
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef Tree2Ref = AutoDisposeProviderRef<List<TreeViewNode<ElementNode>>>;
String _$filteredTree2Hash() => r'373f049f65aeba4f1d754c57010946fd1cbf79be';

/// See also [filteredTree2].
@ProviderFor(filteredTree2)
final filteredTree2Provider =
    AutoDisposeProvider<List<TreeViewNode<ElementNode>>>.internal(
  filteredTree2,
  name: r'filteredTree2Provider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$filteredTree2Hash,
  dependencies: <ProviderOrFamily>[
    tree2Provider,
    componentTreeNotifierProvider
  ],
  allTransitiveDependencies: <ProviderOrFamily>{
    tree2Provider,
    ...?tree2Provider.allTransitiveDependencies,
    componentTreeNotifierProvider,
    ...?componentTreeNotifierProvider.allTransitiveDependencies
  },
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FilteredTree2Ref
    = AutoDisposeProviderRef<List<TreeViewNode<ElementNode>>>;
String _$largestNodeHash() => r'8d12f48ce55658928508960fe2d7b61ad7485b39';

/// See also [largestNode].
@ProviderFor(largestNode)
final largestNodeProvider =
    AutoDisposeProvider<TreeViewNode<ElementNode>>.internal(
  largestNode,
  name: r'largestNodeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$largestNodeHash,
  dependencies: <ProviderOrFamily>[tree2Provider],
  allTransitiveDependencies: <ProviderOrFamily>{
    tree2Provider,
    ...?tree2Provider.allTransitiveDependencies
  },
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LargestNodeRef = AutoDisposeProviderRef<TreeViewNode<ElementNode>>;
String _$componentTreeNotifierHash() =>
    r'efffff9a3eb9a7397a3572e28a18a11e81b6a6e4';

/// See also [ComponentTreeNotifier].
@ProviderFor(ComponentTreeNotifier)
final componentTreeNotifierProvider =
    NotifierProvider<ComponentTreeNotifier, TreeType<NodeData>>.internal(
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

typedef _$ComponentTreeNotifier = Notifier<TreeType<NodeData>>;
String _$nodeHash() => r'6dfed7c9b7361f803c273c996ebe1e3285242723';

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

  static final Iterable<ProviderOrFamily> _dependencies = <ProviderOrFamily>[
    componentTreeNotifierProvider
  ];

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static final Iterable<ProviderOrFamily> _allTransitiveDependencies =
      <ProviderOrFamily>{
    componentTreeNotifierProvider,
    ...?componentTreeNotifierProvider.allTransitiveDependencies
  };

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

String _$treeNodeHash() => r'cd2a994d6c9d233f1c57ace0fbf5965f6542d26f';

abstract class _$TreeNode extends BuildlessAutoDisposeNotifier<Tree?> {
  late final String? id;

  Tree? build(
    String? id,
  );
}

/// See also [TreeNode].
@ProviderFor(TreeNode)
const treeNodeProvider = TreeNodeFamily();

/// See also [TreeNode].
class TreeNodeFamily extends Family<Tree?> {
  /// See also [TreeNode].
  const TreeNodeFamily();

  /// See also [TreeNode].
  TreeNodeProvider call(
    String? id,
  ) {
    return TreeNodeProvider(
      id,
    );
  }

  @override
  TreeNodeProvider getProviderOverride(
    covariant TreeNodeProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static final Iterable<ProviderOrFamily> _dependencies = <ProviderOrFamily>[
    filteredTreeProvider
  ];

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static final Iterable<ProviderOrFamily> _allTransitiveDependencies =
      <ProviderOrFamily>{
    filteredTreeProvider,
    ...?filteredTreeProvider.allTransitiveDependencies
  };

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'treeNodeProvider';
}

/// See also [TreeNode].
class TreeNodeProvider
    extends AutoDisposeNotifierProviderImpl<TreeNode, Tree?> {
  /// See also [TreeNode].
  TreeNodeProvider(
    String? id,
  ) : this._internal(
          () => TreeNode()..id = id,
          from: treeNodeProvider,
          name: r'treeNodeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$treeNodeHash,
          dependencies: TreeNodeFamily._dependencies,
          allTransitiveDependencies: TreeNodeFamily._allTransitiveDependencies,
          id: id,
        );

  TreeNodeProvider._internal(
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
    covariant TreeNode notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(TreeNode Function() create) {
    return ProviderOverride(
      origin: this,
      override: TreeNodeProvider._internal(
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
  AutoDisposeNotifierProviderElement<TreeNode, Tree?> createElement() {
    return _TreeNodeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TreeNodeProvider && other.id == id;
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
mixin TreeNodeRef on AutoDisposeNotifierProviderRef<Tree?> {
  /// The parameter `id` of this provider.
  String? get id;
}

class _TreeNodeProviderElement
    extends AutoDisposeNotifierProviderElement<TreeNode, Tree?>
    with TreeNodeRef {
  _TreeNodeProviderElement(super.provider);

  @override
  String? get id => (origin as TreeNodeProvider).id;
}

String _$searchQueryHash() => r'de2e8ad0652b0646b5174f604903d7af51dde890';

/// See also [SearchQuery].
@ProviderFor(SearchQuery)
final searchQueryProvider = NotifierProvider<SearchQuery, String>.internal(
  SearchQuery.new,
  name: r'searchQueryProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$searchQueryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SearchQuery = Notifier<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
