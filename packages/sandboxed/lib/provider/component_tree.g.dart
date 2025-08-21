// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'component_tree.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(components)
const componentsProvider = ComponentsProvider._();

final class ComponentsProvider extends $FunctionalProvider<
    List<SandboxedElement>,
    List<SandboxedElement>,
    List<SandboxedElement>> with $Provider<List<SandboxedElement>> {
  const ComponentsProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'componentsProvider',
          isAutoDispose: true,
          dependencies: const <ProviderOrFamily>[],
          $allTransitiveDependencies: const <ProviderOrFamily>[],
        );

  @override
  String debugGetCreateSourceHash() => _$componentsHash();

  @$internal
  @override
  $ProviderElement<List<SandboxedElement>> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<SandboxedElement> create(Ref ref) {
    return components(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<SandboxedElement> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<SandboxedElement>>(value),
    );
  }
}

String _$componentsHash() => r'b8a25f787fa019ab57f5c2d4ba933a842d06cf72';

@ProviderFor(ComponentTreeNotifier)
const componentTreeNotifierProvider = ComponentTreeNotifierProvider._();

final class ComponentTreeNotifierProvider
    extends $NotifierProvider<ComponentTreeNotifier, TreeType<NodeData>> {
  const ComponentTreeNotifierProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'componentTreeNotifierProvider',
          isAutoDispose: false,
          dependencies: const <ProviderOrFamily>[componentsProvider],
          $allTransitiveDependencies: const <ProviderOrFamily>[
            ComponentTreeNotifierProvider.$allTransitiveDependencies0,
          ],
        );

  static const $allTransitiveDependencies0 = componentsProvider;

  @override
  String debugGetCreateSourceHash() => _$componentTreeNotifierHash();

  @$internal
  @override
  ComponentTreeNotifier create() => ComponentTreeNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TreeType<NodeData> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TreeType<NodeData>>(value),
    );
  }
}

String _$componentTreeNotifierHash() =>
    r'efffff9a3eb9a7397a3572e28a18a11e81b6a6e4';

abstract class _$ComponentTreeNotifier extends $Notifier<TreeType<NodeData>> {
  TreeType<NodeData> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<TreeType<NodeData>, TreeType<NodeData>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<TreeType<NodeData>, TreeType<NodeData>>,
        TreeType<NodeData>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

@ProviderFor(Node)
const nodeProvider = NodeFamily._();

final class NodeProvider extends $NotifierProvider<Node, Tree?> {
  const NodeProvider._(
      {required NodeFamily super.from, required String? super.argument})
      : super(
          retry: null,
          name: r'nodeProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  static const $allTransitiveDependencies0 = componentTreeNotifierProvider;
  static const $allTransitiveDependencies1 =
      ComponentTreeNotifierProvider.$allTransitiveDependencies0;

  @override
  String debugGetCreateSourceHash() => _$nodeHash();

  @override
  String toString() {
    return r'nodeProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  Node create() => Node();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Tree? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Tree?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is NodeProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$nodeHash() => r'6dfed7c9b7361f803c273c996ebe1e3285242723';

final class NodeFamily extends $Family
    with $ClassFamilyOverride<Node, Tree?, Tree?, Tree?, String?> {
  const NodeFamily._()
      : super(
          retry: null,
          name: r'nodeProvider',
          dependencies: const <ProviderOrFamily>[componentTreeNotifierProvider],
          $allTransitiveDependencies: const <ProviderOrFamily>[
            NodeProvider.$allTransitiveDependencies0,
            NodeProvider.$allTransitiveDependencies1,
          ],
          isAutoDispose: true,
        );

  NodeProvider call(
    String? id,
  ) =>
      NodeProvider._(argument: id, from: this);

  @override
  String toString() => r'nodeProvider';
}

abstract class _$Node extends $Notifier<Tree?> {
  late final _$args = ref.$arg as String?;
  String? get id => _$args;

  Tree? build(
    String? id,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      _$args,
    );
    final ref = this.ref as $Ref<Tree?, Tree?>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<Tree?, Tree?>, Tree?, Object?, Object?>;
    element.handleValue(ref, created);
  }
}

@ProviderFor(TreeNode)
const treeNodeProvider = TreeNodeFamily._();

final class TreeNodeProvider extends $NotifierProvider<TreeNode, Tree?> {
  const TreeNodeProvider._(
      {required TreeNodeFamily super.from, required String? super.argument})
      : super(
          retry: null,
          name: r'treeNodeProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  static const $allTransitiveDependencies0 = filteredTreeProvider;
  static const $allTransitiveDependencies1 =
      FilteredTreeProvider.$allTransitiveDependencies0;
  static const $allTransitiveDependencies2 =
      FilteredTreeProvider.$allTransitiveDependencies1;

  @override
  String debugGetCreateSourceHash() => _$treeNodeHash();

  @override
  String toString() {
    return r'treeNodeProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  TreeNode create() => TreeNode();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Tree? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Tree?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is TreeNodeProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$treeNodeHash() => r'cd2a994d6c9d233f1c57ace0fbf5965f6542d26f';

final class TreeNodeFamily extends $Family
    with $ClassFamilyOverride<TreeNode, Tree?, Tree?, Tree?, String?> {
  const TreeNodeFamily._()
      : super(
          retry: null,
          name: r'treeNodeProvider',
          dependencies: const <ProviderOrFamily>[filteredTreeProvider],
          $allTransitiveDependencies: const <ProviderOrFamily>[
            TreeNodeProvider.$allTransitiveDependencies0,
            TreeNodeProvider.$allTransitiveDependencies1,
            TreeNodeProvider.$allTransitiveDependencies2,
          ],
          isAutoDispose: true,
        );

  TreeNodeProvider call(
    String? id,
  ) =>
      TreeNodeProvider._(argument: id, from: this);

  @override
  String toString() => r'treeNodeProvider';
}

abstract class _$TreeNode extends $Notifier<Tree?> {
  late final _$args = ref.$arg as String?;
  String? get id => _$args;

  Tree? build(
    String? id,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      _$args,
    );
    final ref = this.ref as $Ref<Tree?, Tree?>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<Tree?, Tree?>, Tree?, Object?, Object?>;
    element.handleValue(ref, created);
  }
}

@ProviderFor(SearchQuery)
const searchQueryProvider = SearchQueryProvider._();

final class SearchQueryProvider extends $NotifierProvider<SearchQuery, String> {
  const SearchQueryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'searchQueryProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$searchQueryHash();

  @$internal
  @override
  SearchQuery create() => SearchQuery();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$searchQueryHash() => r'de2e8ad0652b0646b5174f604903d7af51dde890';

abstract class _$SearchQuery extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<String, String>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<String, String>, String, Object?, Object?>;
    element.handleValue(ref, created);
  }
}

@ProviderFor(filteredTree)
const filteredTreeProvider = FilteredTreeProvider._();

final class FilteredTreeProvider
    extends $FunctionalProvider<Tree?, Tree?, Tree?> with $Provider<Tree?> {
  const FilteredTreeProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'filteredTreeProvider',
          isAutoDispose: true,
          dependencies: const <ProviderOrFamily>[componentTreeNotifierProvider],
          $allTransitiveDependencies: const <ProviderOrFamily>[
            FilteredTreeProvider.$allTransitiveDependencies0,
            FilteredTreeProvider.$allTransitiveDependencies1,
          ],
        );

  static const $allTransitiveDependencies0 = componentTreeNotifierProvider;
  static const $allTransitiveDependencies1 =
      ComponentTreeNotifierProvider.$allTransitiveDependencies0;

  @override
  String debugGetCreateSourceHash() => _$filteredTreeHash();

  @$internal
  @override
  $ProviderElement<Tree?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Tree? create(Ref ref) {
    return filteredTree(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Tree? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Tree?>(value),
    );
  }
}

String _$filteredTreeHash() => r'd53650f8dbdcb5ec926fc79154de1d5d31bfd591';

@ProviderFor(tree2)
const tree2Provider = Tree2Provider._();

final class Tree2Provider extends $FunctionalProvider<
        List<TreeViewNode<ElementNode>>,
        List<TreeViewNode<ElementNode>>,
        List<TreeViewNode<ElementNode>>>
    with $Provider<List<TreeViewNode<ElementNode>>> {
  const Tree2Provider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'tree2Provider',
          isAutoDispose: true,
          dependencies: const <ProviderOrFamily>[componentTreeNotifierProvider],
          $allTransitiveDependencies: const <ProviderOrFamily>[
            Tree2Provider.$allTransitiveDependencies0,
            Tree2Provider.$allTransitiveDependencies1,
          ],
        );

  static const $allTransitiveDependencies0 = componentTreeNotifierProvider;
  static const $allTransitiveDependencies1 =
      ComponentTreeNotifierProvider.$allTransitiveDependencies0;

  @override
  String debugGetCreateSourceHash() => _$tree2Hash();

  @$internal
  @override
  $ProviderElement<List<TreeViewNode<ElementNode>>> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<TreeViewNode<ElementNode>> create(Ref ref) {
    return tree2(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<TreeViewNode<ElementNode>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<List<TreeViewNode<ElementNode>>>(value),
    );
  }
}

String _$tree2Hash() => r'9fd9eaccf00606e449edac6e8049dac53ef2d14c';

@ProviderFor(filteredTree2)
const filteredTree2Provider = FilteredTree2Provider._();

final class FilteredTree2Provider extends $FunctionalProvider<
        List<TreeViewNode<ElementNode>>,
        List<TreeViewNode<ElementNode>>,
        List<TreeViewNode<ElementNode>>>
    with $Provider<List<TreeViewNode<ElementNode>>> {
  const FilteredTree2Provider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'filteredTree2Provider',
          isAutoDispose: true,
          dependencies: const <ProviderOrFamily>[
            tree2Provider,
            componentTreeNotifierProvider
          ],
          $allTransitiveDependencies: const <ProviderOrFamily>[
            FilteredTree2Provider.$allTransitiveDependencies0,
            FilteredTree2Provider.$allTransitiveDependencies1,
            FilteredTree2Provider.$allTransitiveDependencies2,
          ],
        );

  static const $allTransitiveDependencies0 = tree2Provider;
  static const $allTransitiveDependencies1 =
      Tree2Provider.$allTransitiveDependencies0;
  static const $allTransitiveDependencies2 =
      Tree2Provider.$allTransitiveDependencies1;

  @override
  String debugGetCreateSourceHash() => _$filteredTree2Hash();

  @$internal
  @override
  $ProviderElement<List<TreeViewNode<ElementNode>>> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<TreeViewNode<ElementNode>> create(Ref ref) {
    return filteredTree2(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<TreeViewNode<ElementNode>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<List<TreeViewNode<ElementNode>>>(value),
    );
  }
}

String _$filteredTree2Hash() => r'373f049f65aeba4f1d754c57010946fd1cbf79be';

@ProviderFor(largestNode)
const largestNodeProvider = LargestNodeProvider._();

final class LargestNodeProvider extends $FunctionalProvider<
    TreeViewNode<ElementNode>,
    TreeViewNode<ElementNode>,
    TreeViewNode<ElementNode>> with $Provider<TreeViewNode<ElementNode>> {
  const LargestNodeProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'largestNodeProvider',
          isAutoDispose: true,
          dependencies: const <ProviderOrFamily>[tree2Provider],
          $allTransitiveDependencies: const <ProviderOrFamily>[
            LargestNodeProvider.$allTransitiveDependencies0,
            LargestNodeProvider.$allTransitiveDependencies1,
            LargestNodeProvider.$allTransitiveDependencies2,
          ],
        );

  static const $allTransitiveDependencies0 = tree2Provider;
  static const $allTransitiveDependencies1 =
      Tree2Provider.$allTransitiveDependencies0;
  static const $allTransitiveDependencies2 =
      Tree2Provider.$allTransitiveDependencies1;

  @override
  String debugGetCreateSourceHash() => _$largestNodeHash();

  @$internal
  @override
  $ProviderElement<TreeViewNode<ElementNode>> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TreeViewNode<ElementNode> create(Ref ref) {
    return largestNode(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TreeViewNode<ElementNode> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TreeViewNode<ElementNode>>(value),
    );
  }
}

String _$largestNodeHash() => r'8d12f48ce55658928508960fe2d7b61ad7485b39';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
