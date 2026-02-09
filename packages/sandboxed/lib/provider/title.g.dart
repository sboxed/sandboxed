// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'title.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(title)
final titleProvider = TitleProvider._();

final class TitleProvider extends $FunctionalProvider<Widget, Widget, Widget>
    with $Provider<Widget> {
  TitleProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'titleProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$titleHash();

  @$internal
  @override
  $ProviderElement<Widget> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Widget create(Ref ref) {
    return title(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Widget value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Widget>(value),
    );
  }
}

String _$titleHash() => r'a44a0a9637dba258b13cd92879c1a2be744df0d3';
