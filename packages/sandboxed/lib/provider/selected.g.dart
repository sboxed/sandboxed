// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SelectedElementNotifier)
final selectedElementNotifierProvider = SelectedElementNotifierProvider._();

final class SelectedElementNotifierProvider
    extends $NotifierProvider<SelectedElementNotifier, String?> {
  SelectedElementNotifierProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'selectedElementNotifierProvider',
          isAutoDispose: false,
          dependencies: <ProviderOrFamily>[],
          $allTransitiveDependencies: <ProviderOrFamily>[],
        );

  @override
  String debugGetCreateSourceHash() => _$selectedElementNotifierHash();

  @$internal
  @override
  SelectedElementNotifier create() => SelectedElementNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String?>(value),
    );
  }
}

String _$selectedElementNotifierHash() =>
    r'6e628bebbf2028fc967efc4d8ef95c9bc2503419';

abstract class _$SelectedElementNotifier extends $Notifier<String?> {
  String? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<String?, String?>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<String?, String?>, String?, Object?, Object?>;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(selection)
final selectionProvider = SelectionFamily._();

final class SelectionProvider
    extends $FunctionalProvider<Selection?, Selection?, Selection?>
    with $Provider<Selection?> {
  SelectionProvider._(
      {required SelectionFamily super.from, required String super.argument})
      : super(
          retry: null,
          name: r'selectionProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  static final $allTransitiveDependencies0 = nodeProvider;
  static final $allTransitiveDependencies1 =
      NodeProvider.$allTransitiveDependencies0;
  static final $allTransitiveDependencies2 =
      NodeProvider.$allTransitiveDependencies1;

  @override
  String debugGetCreateSourceHash() => _$selectionHash();

  @override
  String toString() {
    return r'selectionProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<Selection?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Selection? create(Ref ref) {
    final argument = this.argument as String;
    return selection(
      ref,
      argument,
    );
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Selection? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Selection?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SelectionProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$selectionHash() => r'bbe0f5f83efb158b1a0e6b55656dc2cf1ad1e393';

final class SelectionFamily extends $Family
    with $FunctionalFamilyOverride<Selection?, String> {
  SelectionFamily._()
      : super(
          retry: null,
          name: r'selectionProvider',
          dependencies: <ProviderOrFamily>[nodeProvider],
          $allTransitiveDependencies: <ProviderOrFamily>[
            SelectionProvider.$allTransitiveDependencies0,
            SelectionProvider.$allTransitiveDependencies1,
            SelectionProvider.$allTransitiveDependencies2,
          ],
          isAutoDispose: true,
        );

  SelectionProvider call(
    String id,
  ) =>
      SelectionProvider._(argument: id, from: this);

  @override
  String toString() => r'selectionProvider';
}

@ProviderFor(selectedElement)
final selectedElementProvider = SelectedElementProvider._();

final class SelectedElementProvider
    extends $FunctionalProvider<Selection?, Selection?, Selection?>
    with $Provider<Selection?> {
  SelectedElementProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'selectedElementProvider',
          isAutoDispose: true,
          dependencies: <ProviderOrFamily>[
            selectionProvider,
            selectedElementNotifierProvider
          ],
          $allTransitiveDependencies: <ProviderOrFamily>{
            SelectedElementProvider.$allTransitiveDependencies0,
            SelectedElementProvider.$allTransitiveDependencies1,
            SelectedElementProvider.$allTransitiveDependencies2,
            SelectedElementProvider.$allTransitiveDependencies3,
            SelectedElementProvider.$allTransitiveDependencies4,
          },
        );

  static final $allTransitiveDependencies0 = selectionProvider;
  static final $allTransitiveDependencies1 =
      SelectionProvider.$allTransitiveDependencies0;
  static final $allTransitiveDependencies2 =
      SelectionProvider.$allTransitiveDependencies1;
  static final $allTransitiveDependencies3 =
      SelectionProvider.$allTransitiveDependencies2;
  static final $allTransitiveDependencies4 = selectedElementNotifierProvider;

  @override
  String debugGetCreateSourceHash() => _$selectedElementHash();

  @$internal
  @override
  $ProviderElement<Selection?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Selection? create(Ref ref) {
    return selectedElement(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Selection? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Selection?>(value),
    );
  }
}

String _$selectedElementHash() => r'5100ef9135f30789202557e4d1c87147909f0e2c';
