// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Settings {
  double? get interfaceScale;
  bool get denseExplorer;
  Set<FeatureFlags> get optInFeatures;
  Map<String, PanelPosition> get positions;

  /// Create a copy of Settings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SettingsCopyWith<Settings> get copyWith =>
      _$SettingsCopyWithImpl<Settings>(this as Settings, _$identity);

  /// Serializes this Settings to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Settings &&
            (identical(other.interfaceScale, interfaceScale) ||
                other.interfaceScale == interfaceScale) &&
            (identical(other.denseExplorer, denseExplorer) ||
                other.denseExplorer == denseExplorer) &&
            const DeepCollectionEquality()
                .equals(other.optInFeatures, optInFeatures) &&
            const DeepCollectionEquality().equals(other.positions, positions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      interfaceScale,
      denseExplorer,
      const DeepCollectionEquality().hash(optInFeatures),
      const DeepCollectionEquality().hash(positions));

  @override
  String toString() {
    return 'Settings(interfaceScale: $interfaceScale, denseExplorer: $denseExplorer, optInFeatures: $optInFeatures, positions: $positions)';
  }
}

/// @nodoc
abstract mixin class $SettingsCopyWith<$Res> {
  factory $SettingsCopyWith(Settings value, $Res Function(Settings) _then) =
      _$SettingsCopyWithImpl;
  @useResult
  $Res call(
      {double? interfaceScale,
      bool denseExplorer,
      Set<FeatureFlags> optInFeatures,
      Map<String, PanelPosition> positions});
}

/// @nodoc
class _$SettingsCopyWithImpl<$Res> implements $SettingsCopyWith<$Res> {
  _$SettingsCopyWithImpl(this._self, this._then);

  final Settings _self;
  final $Res Function(Settings) _then;

  /// Create a copy of Settings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? interfaceScale = freezed,
    Object? denseExplorer = null,
    Object? optInFeatures = null,
    Object? positions = null,
  }) {
    return _then(_self.copyWith(
      interfaceScale: freezed == interfaceScale
          ? _self.interfaceScale
          : interfaceScale // ignore: cast_nullable_to_non_nullable
              as double?,
      denseExplorer: null == denseExplorer
          ? _self.denseExplorer
          : denseExplorer // ignore: cast_nullable_to_non_nullable
              as bool,
      optInFeatures: null == optInFeatures
          ? _self.optInFeatures
          : optInFeatures // ignore: cast_nullable_to_non_nullable
              as Set<FeatureFlags>,
      positions: null == positions
          ? _self.positions
          : positions // ignore: cast_nullable_to_non_nullable
              as Map<String, PanelPosition>,
    ));
  }
}

/// Adds pattern-matching-related methods to [Settings].
extension SettingsPatterns on Settings {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Settings value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Settings() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Settings value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Settings():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Settings value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Settings() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            double? interfaceScale,
            bool denseExplorer,
            Set<FeatureFlags> optInFeatures,
            Map<String, PanelPosition> positions)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Settings() when $default != null:
        return $default(_that.interfaceScale, _that.denseExplorer,
            _that.optInFeatures, _that.positions);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            double? interfaceScale,
            bool denseExplorer,
            Set<FeatureFlags> optInFeatures,
            Map<String, PanelPosition> positions)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Settings():
        return $default(_that.interfaceScale, _that.denseExplorer,
            _that.optInFeatures, _that.positions);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            double? interfaceScale,
            bool denseExplorer,
            Set<FeatureFlags> optInFeatures,
            Map<String, PanelPosition> positions)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Settings() when $default != null:
        return $default(_that.interfaceScale, _that.denseExplorer,
            _that.optInFeatures, _that.positions);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Settings implements Settings {
  const _Settings(
      {required this.interfaceScale,
      required this.denseExplorer,
      final Set<FeatureFlags> optInFeatures = const <FeatureFlags>{},
      final Map<String, PanelPosition> positions =
          const <String, PanelPosition>{}})
      : _optInFeatures = optInFeatures,
        _positions = positions;
  factory _Settings.fromJson(Map<String, dynamic> json) =>
      _$SettingsFromJson(json);

  @override
  final double? interfaceScale;
  @override
  final bool denseExplorer;
  final Set<FeatureFlags> _optInFeatures;
  @override
  @JsonKey()
  Set<FeatureFlags> get optInFeatures {
    if (_optInFeatures is EqualUnmodifiableSetView) return _optInFeatures;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_optInFeatures);
  }

  final Map<String, PanelPosition> _positions;
  @override
  @JsonKey()
  Map<String, PanelPosition> get positions {
    if (_positions is EqualUnmodifiableMapView) return _positions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_positions);
  }

  /// Create a copy of Settings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SettingsCopyWith<_Settings> get copyWith =>
      __$SettingsCopyWithImpl<_Settings>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SettingsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Settings &&
            (identical(other.interfaceScale, interfaceScale) ||
                other.interfaceScale == interfaceScale) &&
            (identical(other.denseExplorer, denseExplorer) ||
                other.denseExplorer == denseExplorer) &&
            const DeepCollectionEquality()
                .equals(other._optInFeatures, _optInFeatures) &&
            const DeepCollectionEquality()
                .equals(other._positions, _positions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      interfaceScale,
      denseExplorer,
      const DeepCollectionEquality().hash(_optInFeatures),
      const DeepCollectionEquality().hash(_positions));

  @override
  String toString() {
    return 'Settings(interfaceScale: $interfaceScale, denseExplorer: $denseExplorer, optInFeatures: $optInFeatures, positions: $positions)';
  }
}

/// @nodoc
abstract mixin class _$SettingsCopyWith<$Res>
    implements $SettingsCopyWith<$Res> {
  factory _$SettingsCopyWith(_Settings value, $Res Function(_Settings) _then) =
      __$SettingsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {double? interfaceScale,
      bool denseExplorer,
      Set<FeatureFlags> optInFeatures,
      Map<String, PanelPosition> positions});
}

/// @nodoc
class __$SettingsCopyWithImpl<$Res> implements _$SettingsCopyWith<$Res> {
  __$SettingsCopyWithImpl(this._self, this._then);

  final _Settings _self;
  final $Res Function(_Settings) _then;

  /// Create a copy of Settings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? interfaceScale = freezed,
    Object? denseExplorer = null,
    Object? optInFeatures = null,
    Object? positions = null,
  }) {
    return _then(_Settings(
      interfaceScale: freezed == interfaceScale
          ? _self.interfaceScale
          : interfaceScale // ignore: cast_nullable_to_non_nullable
              as double?,
      denseExplorer: null == denseExplorer
          ? _self.denseExplorer
          : denseExplorer // ignore: cast_nullable_to_non_nullable
              as bool,
      optInFeatures: null == optInFeatures
          ? _self._optInFeatures
          : optInFeatures // ignore: cast_nullable_to_non_nullable
              as Set<FeatureFlags>,
      positions: null == positions
          ? _self._positions
          : positions // ignore: cast_nullable_to_non_nullable
              as Map<String, PanelPosition>,
    ));
  }
}

// dart format on
