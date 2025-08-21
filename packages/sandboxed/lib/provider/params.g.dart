// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'params.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(paramsScopeId)
const paramsScopeIdProvider = ParamsScopeIdProvider._();

final class ParamsScopeIdProvider
    extends $FunctionalProvider<String, String, String> with $Provider<String> {
  const ParamsScopeIdProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'paramsScopeIdProvider',
          isAutoDispose: true,
          dependencies: const <ProviderOrFamily>[
            selectedElementNotifierProvider
          ],
          $allTransitiveDependencies: const <ProviderOrFamily>[
            ParamsScopeIdProvider.$allTransitiveDependencies0,
          ],
        );

  static const $allTransitiveDependencies0 = selectedElementNotifierProvider;

  @override
  String debugGetCreateSourceHash() => _$paramsScopeIdHash();

  @$internal
  @override
  $ProviderElement<String> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String create(Ref ref) {
    return paramsScopeId(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$paramsScopeIdHash() => r'84f5764839e00fba92207393cad65c1b5fe4d362';

@ProviderFor(params)
const paramsProvider = ParamsFamily._();

final class ParamsProvider extends $FunctionalProvider<
    Raw<ParamsNotifier>,
    Raw<ParamsNotifier>,
    Raw<ParamsNotifier>> with $Provider<Raw<ParamsNotifier>> {
  const ParamsProvider._(
      {required ParamsFamily super.from, required String super.argument})
      : super(
          retry: null,
          name: r'paramsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  static const $allTransitiveDependencies0 = addonsProvider;
  static const $allTransitiveDependencies1 =
      AddonsProvider.$allTransitiveDependencies0;

  @override
  String debugGetCreateSourceHash() => _$paramsHash();

  @override
  String toString() {
    return r'paramsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<Raw<ParamsNotifier>> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Raw<ParamsNotifier> create(Ref ref) {
    final argument = this.argument as String;
    return params(
      ref,
      argument,
    );
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Raw<ParamsNotifier> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Raw<ParamsNotifier>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ParamsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$paramsHash() => r'a1e9b06d01ac0977c3bf5f0efe5babadfff354c8';

final class ParamsFamily extends $Family
    with $FunctionalFamilyOverride<Raw<ParamsNotifier>, String> {
  const ParamsFamily._()
      : super(
          retry: null,
          name: r'paramsProvider',
          dependencies: const <ProviderOrFamily>[addonsProvider],
          $allTransitiveDependencies: const <ProviderOrFamily>[
            ParamsProvider.$allTransitiveDependencies0,
            ParamsProvider.$allTransitiveDependencies1,
          ],
          isAutoDispose: true,
        );

  ParamsProvider call(
    String id,
  ) =>
      ParamsProvider._(argument: id, from: this);

  @override
  String toString() => r'paramsProvider';
}

@ProviderFor(serializer)
const serializerProvider = SerializerProvider._();

final class SerializerProvider extends $FunctionalProvider<ParamSerializer,
    ParamSerializer, ParamSerializer> with $Provider<ParamSerializer> {
  const SerializerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'serializerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$serializerHash();

  @$internal
  @override
  $ProviderElement<ParamSerializer> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ParamSerializer create(Ref ref) {
    return serializer(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ParamSerializer value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ParamSerializer>(value),
    );
  }
}

String _$serializerHash() => r'ae392afe85818da319ab04d4c1830ae1544181c3';

@ProviderFor(ParamsQuery)
const paramsQueryProvider = ParamsQueryFamily._();

final class ParamsQueryProvider
    extends $NotifierProvider<ParamsQuery, String?> {
  const ParamsQueryProvider._(
      {required ParamsQueryFamily super.from, required String super.argument})
      : super(
          retry: null,
          name: r'paramsQueryProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  static const $allTransitiveDependencies0 = paramsProvider;
  static const $allTransitiveDependencies1 =
      ParamsProvider.$allTransitiveDependencies0;
  static const $allTransitiveDependencies2 =
      ParamsProvider.$allTransitiveDependencies1;

  @override
  String debugGetCreateSourceHash() => _$paramsQueryHash();

  @override
  String toString() {
    return r'paramsQueryProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ParamsQuery create() => ParamsQuery();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ParamsQueryProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$paramsQueryHash() => r'299fda81b36b21a421aa54b5238240742da92c3a';

final class ParamsQueryFamily extends $Family
    with $ClassFamilyOverride<ParamsQuery, String?, String?, String?, String> {
  const ParamsQueryFamily._()
      : super(
          retry: null,
          name: r'paramsQueryProvider',
          dependencies: const <ProviderOrFamily>[paramsProvider],
          $allTransitiveDependencies: const <ProviderOrFamily>[
            ParamsQueryProvider.$allTransitiveDependencies0,
            ParamsQueryProvider.$allTransitiveDependencies1,
            ParamsQueryProvider.$allTransitiveDependencies2,
          ],
          isAutoDispose: false,
        );

  ParamsQueryProvider call(
    String id,
  ) =>
      ParamsQueryProvider._(argument: id, from: this);

  @override
  String toString() => r'paramsQueryProvider';
}

abstract class _$ParamsQuery extends $Notifier<String?> {
  late final _$args = ref.$arg as String;
  String get id => _$args;

  String? build(
    String id,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      _$args,
    );
    final ref = this.ref as $Ref<String?, String?>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<String?, String?>, String?, Object?, Object?>;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
