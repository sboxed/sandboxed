// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'component_tree_node.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ElementNode implements DiagnosticableTreeMixin {
  int get level;
  int get index;
  String get id;
  String get title;
  bool get isExpanded;

  /// Create a copy of ElementNode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ElementNodeCopyWith<ElementNode> get copyWith =>
      _$ElementNodeCopyWithImpl<ElementNode>(this as ElementNode, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'ElementNode'))
      ..add(DiagnosticsProperty('level', level))
      ..add(DiagnosticsProperty('index', index))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('isExpanded', isExpanded));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ElementNode &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.isExpanded, isExpanded) ||
                other.isExpanded == isExpanded));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, level, index, id, title, isExpanded);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ElementNode(level: $level, index: $index, id: $id, title: $title, isExpanded: $isExpanded)';
  }
}

/// @nodoc
abstract mixin class $ElementNodeCopyWith<$Res> {
  factory $ElementNodeCopyWith(
          ElementNode value, $Res Function(ElementNode) _then) =
      _$ElementNodeCopyWithImpl;
  @useResult
  $Res call({int level, int index, String id, String title, bool isExpanded});
}

/// @nodoc
class _$ElementNodeCopyWithImpl<$Res> implements $ElementNodeCopyWith<$Res> {
  _$ElementNodeCopyWithImpl(this._self, this._then);

  final ElementNode _self;
  final $Res Function(ElementNode) _then;

  /// Create a copy of ElementNode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? level = null,
    Object? index = null,
    Object? id = null,
    Object? title = null,
    Object? isExpanded = null,
  }) {
    return _then(_self.copyWith(
      level: null == level
          ? _self.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      index: null == index
          ? _self.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isExpanded: null == isExpanded
          ? _self.isExpanded
          : isExpanded // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [ElementNode].
extension ElementNodePatterns on ElementNode {
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
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RootNode value)? root,
    TResult Function(ModuleNode value)? module,
    TResult Function(FolderNode value)? folder,
    TResult Function(ComponentNode value)? component,
    TResult Function(DocumentationNode value)? documentation,
    TResult Function(StoryNode value)? story,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case RootNode() when root != null:
        return root(_that);
      case ModuleNode() when module != null:
        return module(_that);
      case FolderNode() when folder != null:
        return folder(_that);
      case ComponentNode() when component != null:
        return component(_that);
      case DocumentationNode() when documentation != null:
        return documentation(_that);
      case StoryNode() when story != null:
        return story(_that);
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
  TResult map<TResult extends Object?>({
    required TResult Function(RootNode value) root,
    required TResult Function(ModuleNode value) module,
    required TResult Function(FolderNode value) folder,
    required TResult Function(ComponentNode value) component,
    required TResult Function(DocumentationNode value) documentation,
    required TResult Function(StoryNode value) story,
  }) {
    final _that = this;
    switch (_that) {
      case RootNode():
        return root(_that);
      case ModuleNode():
        return module(_that);
      case FolderNode():
        return folder(_that);
      case ComponentNode():
        return component(_that);
      case DocumentationNode():
        return documentation(_that);
      case StoryNode():
        return story(_that);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RootNode value)? root,
    TResult? Function(ModuleNode value)? module,
    TResult? Function(FolderNode value)? folder,
    TResult? Function(ComponentNode value)? component,
    TResult? Function(DocumentationNode value)? documentation,
    TResult? Function(StoryNode value)? story,
  }) {
    final _that = this;
    switch (_that) {
      case RootNode() when root != null:
        return root(_that);
      case ModuleNode() when module != null:
        return module(_that);
      case FolderNode() when folder != null:
        return folder(_that);
      case ComponentNode() when component != null:
        return component(_that);
      case DocumentationNode() when documentation != null:
        return documentation(_that);
      case StoryNode() when story != null:
        return story(_that);
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
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int level, int index, String id, String title, bool isExpanded)?
        root,
    TResult Function(
            int level, int index, String id, String title, bool isExpanded)?
        module,
    TResult Function(
            int level, int index, String id, String title, bool isExpanded)?
        folder,
    TResult Function(int level, int index, String id, String title,
            bool isExpanded, Component component)?
        component,
    TResult Function(int level, int index, String id, String title,
            bool isExpanded, Component component, DocumentEntry document)?
        documentation,
    TResult Function(int level, int index, String id, String title,
            bool isExpanded, Component component, Story story)?
        story,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case RootNode() when root != null:
        return root(
            _that.level, _that.index, _that.id, _that.title, _that.isExpanded);
      case ModuleNode() when module != null:
        return module(
            _that.level, _that.index, _that.id, _that.title, _that.isExpanded);
      case FolderNode() when folder != null:
        return folder(
            _that.level, _that.index, _that.id, _that.title, _that.isExpanded);
      case ComponentNode() when component != null:
        return component(_that.level, _that.index, _that.id, _that.title,
            _that.isExpanded, _that.component);
      case DocumentationNode() when documentation != null:
        return documentation(_that.level, _that.index, _that.id, _that.title,
            _that.isExpanded, _that.component, _that.document);
      case StoryNode() when story != null:
        return story(_that.level, _that.index, _that.id, _that.title,
            _that.isExpanded, _that.component, _that.story);
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
  TResult when<TResult extends Object?>({
    required TResult Function(
            int level, int index, String id, String title, bool isExpanded)
        root,
    required TResult Function(
            int level, int index, String id, String title, bool isExpanded)
        module,
    required TResult Function(
            int level, int index, String id, String title, bool isExpanded)
        folder,
    required TResult Function(int level, int index, String id, String title,
            bool isExpanded, Component component)
        component,
    required TResult Function(int level, int index, String id, String title,
            bool isExpanded, Component component, DocumentEntry document)
        documentation,
    required TResult Function(int level, int index, String id, String title,
            bool isExpanded, Component component, Story story)
        story,
  }) {
    final _that = this;
    switch (_that) {
      case RootNode():
        return root(
            _that.level, _that.index, _that.id, _that.title, _that.isExpanded);
      case ModuleNode():
        return module(
            _that.level, _that.index, _that.id, _that.title, _that.isExpanded);
      case FolderNode():
        return folder(
            _that.level, _that.index, _that.id, _that.title, _that.isExpanded);
      case ComponentNode():
        return component(_that.level, _that.index, _that.id, _that.title,
            _that.isExpanded, _that.component);
      case DocumentationNode():
        return documentation(_that.level, _that.index, _that.id, _that.title,
            _that.isExpanded, _that.component, _that.document);
      case StoryNode():
        return story(_that.level, _that.index, _that.id, _that.title,
            _that.isExpanded, _that.component, _that.story);
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int level, int index, String id, String title, bool isExpanded)?
        root,
    TResult? Function(
            int level, int index, String id, String title, bool isExpanded)?
        module,
    TResult? Function(
            int level, int index, String id, String title, bool isExpanded)?
        folder,
    TResult? Function(int level, int index, String id, String title,
            bool isExpanded, Component component)?
        component,
    TResult? Function(int level, int index, String id, String title,
            bool isExpanded, Component component, DocumentEntry document)?
        documentation,
    TResult? Function(int level, int index, String id, String title,
            bool isExpanded, Component component, Story story)?
        story,
  }) {
    final _that = this;
    switch (_that) {
      case RootNode() when root != null:
        return root(
            _that.level, _that.index, _that.id, _that.title, _that.isExpanded);
      case ModuleNode() when module != null:
        return module(
            _that.level, _that.index, _that.id, _that.title, _that.isExpanded);
      case FolderNode() when folder != null:
        return folder(
            _that.level, _that.index, _that.id, _that.title, _that.isExpanded);
      case ComponentNode() when component != null:
        return component(_that.level, _that.index, _that.id, _that.title,
            _that.isExpanded, _that.component);
      case DocumentationNode() when documentation != null:
        return documentation(_that.level, _that.index, _that.id, _that.title,
            _that.isExpanded, _that.component, _that.document);
      case StoryNode() when story != null:
        return story(_that.level, _that.index, _that.id, _that.title,
            _that.isExpanded, _that.component, _that.story);
      case _:
        return null;
    }
  }
}

/// @nodoc

class RootNode extends ElementNode with DiagnosticableTreeMixin {
  const RootNode(
      {required this.level,
      required this.index,
      required this.id,
      required this.title,
      required this.isExpanded})
      : super._();

  @override
  final int level;
  @override
  final int index;
  @override
  final String id;
  @override
  final String title;
  @override
  final bool isExpanded;

  /// Create a copy of ElementNode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RootNodeCopyWith<RootNode> get copyWith =>
      _$RootNodeCopyWithImpl<RootNode>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'ElementNode.root'))
      ..add(DiagnosticsProperty('level', level))
      ..add(DiagnosticsProperty('index', index))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('isExpanded', isExpanded));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RootNode &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.isExpanded, isExpanded) ||
                other.isExpanded == isExpanded));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, level, index, id, title, isExpanded);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ElementNode.root(level: $level, index: $index, id: $id, title: $title, isExpanded: $isExpanded)';
  }
}

/// @nodoc
abstract mixin class $RootNodeCopyWith<$Res>
    implements $ElementNodeCopyWith<$Res> {
  factory $RootNodeCopyWith(RootNode value, $Res Function(RootNode) _then) =
      _$RootNodeCopyWithImpl;
  @override
  @useResult
  $Res call({int level, int index, String id, String title, bool isExpanded});
}

/// @nodoc
class _$RootNodeCopyWithImpl<$Res> implements $RootNodeCopyWith<$Res> {
  _$RootNodeCopyWithImpl(this._self, this._then);

  final RootNode _self;
  final $Res Function(RootNode) _then;

  /// Create a copy of ElementNode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? level = null,
    Object? index = null,
    Object? id = null,
    Object? title = null,
    Object? isExpanded = null,
  }) {
    return _then(RootNode(
      level: null == level
          ? _self.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      index: null == index
          ? _self.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isExpanded: null == isExpanded
          ? _self.isExpanded
          : isExpanded // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class ModuleNode extends ElementNode with DiagnosticableTreeMixin {
  const ModuleNode(
      {required this.level,
      required this.index,
      required this.id,
      required this.title,
      required this.isExpanded})
      : super._();

  @override
  final int level;
  @override
  final int index;
  @override
  final String id;
  @override
  final String title;
  @override
  final bool isExpanded;

  /// Create a copy of ElementNode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ModuleNodeCopyWith<ModuleNode> get copyWith =>
      _$ModuleNodeCopyWithImpl<ModuleNode>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'ElementNode.module'))
      ..add(DiagnosticsProperty('level', level))
      ..add(DiagnosticsProperty('index', index))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('isExpanded', isExpanded));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ModuleNode &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.isExpanded, isExpanded) ||
                other.isExpanded == isExpanded));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, level, index, id, title, isExpanded);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ElementNode.module(level: $level, index: $index, id: $id, title: $title, isExpanded: $isExpanded)';
  }
}

/// @nodoc
abstract mixin class $ModuleNodeCopyWith<$Res>
    implements $ElementNodeCopyWith<$Res> {
  factory $ModuleNodeCopyWith(
          ModuleNode value, $Res Function(ModuleNode) _then) =
      _$ModuleNodeCopyWithImpl;
  @override
  @useResult
  $Res call({int level, int index, String id, String title, bool isExpanded});
}

/// @nodoc
class _$ModuleNodeCopyWithImpl<$Res> implements $ModuleNodeCopyWith<$Res> {
  _$ModuleNodeCopyWithImpl(this._self, this._then);

  final ModuleNode _self;
  final $Res Function(ModuleNode) _then;

  /// Create a copy of ElementNode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? level = null,
    Object? index = null,
    Object? id = null,
    Object? title = null,
    Object? isExpanded = null,
  }) {
    return _then(ModuleNode(
      level: null == level
          ? _self.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      index: null == index
          ? _self.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isExpanded: null == isExpanded
          ? _self.isExpanded
          : isExpanded // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class FolderNode extends ElementNode with DiagnosticableTreeMixin {
  const FolderNode(
      {required this.level,
      required this.index,
      required this.id,
      required this.title,
      required this.isExpanded})
      : super._();

  @override
  final int level;
  @override
  final int index;
  @override
  final String id;
  @override
  final String title;
  @override
  final bool isExpanded;

  /// Create a copy of ElementNode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FolderNodeCopyWith<FolderNode> get copyWith =>
      _$FolderNodeCopyWithImpl<FolderNode>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'ElementNode.folder'))
      ..add(DiagnosticsProperty('level', level))
      ..add(DiagnosticsProperty('index', index))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('isExpanded', isExpanded));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FolderNode &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.isExpanded, isExpanded) ||
                other.isExpanded == isExpanded));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, level, index, id, title, isExpanded);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ElementNode.folder(level: $level, index: $index, id: $id, title: $title, isExpanded: $isExpanded)';
  }
}

/// @nodoc
abstract mixin class $FolderNodeCopyWith<$Res>
    implements $ElementNodeCopyWith<$Res> {
  factory $FolderNodeCopyWith(
          FolderNode value, $Res Function(FolderNode) _then) =
      _$FolderNodeCopyWithImpl;
  @override
  @useResult
  $Res call({int level, int index, String id, String title, bool isExpanded});
}

/// @nodoc
class _$FolderNodeCopyWithImpl<$Res> implements $FolderNodeCopyWith<$Res> {
  _$FolderNodeCopyWithImpl(this._self, this._then);

  final FolderNode _self;
  final $Res Function(FolderNode) _then;

  /// Create a copy of ElementNode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? level = null,
    Object? index = null,
    Object? id = null,
    Object? title = null,
    Object? isExpanded = null,
  }) {
    return _then(FolderNode(
      level: null == level
          ? _self.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      index: null == index
          ? _self.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isExpanded: null == isExpanded
          ? _self.isExpanded
          : isExpanded // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class ComponentNode extends ElementNode with DiagnosticableTreeMixin {
  const ComponentNode(
      {required this.level,
      required this.index,
      required this.id,
      required this.title,
      this.isExpanded = true,
      required this.component})
      : super._();

  @override
  final int level;
  @override
  final int index;
  @override
  final String id;
  @override
  final String title;
  @override
  @JsonKey()
  final bool isExpanded;
  final Component component;

  /// Create a copy of ElementNode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ComponentNodeCopyWith<ComponentNode> get copyWith =>
      _$ComponentNodeCopyWithImpl<ComponentNode>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'ElementNode.component'))
      ..add(DiagnosticsProperty('level', level))
      ..add(DiagnosticsProperty('index', index))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('isExpanded', isExpanded))
      ..add(DiagnosticsProperty('component', component));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ComponentNode &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.isExpanded, isExpanded) ||
                other.isExpanded == isExpanded) &&
            (identical(other.component, component) ||
                other.component == component));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, level, index, id, title, isExpanded, component);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ElementNode.component(level: $level, index: $index, id: $id, title: $title, isExpanded: $isExpanded, component: $component)';
  }
}

/// @nodoc
abstract mixin class $ComponentNodeCopyWith<$Res>
    implements $ElementNodeCopyWith<$Res> {
  factory $ComponentNodeCopyWith(
          ComponentNode value, $Res Function(ComponentNode) _then) =
      _$ComponentNodeCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int level,
      int index,
      String id,
      String title,
      bool isExpanded,
      Component component});
}

/// @nodoc
class _$ComponentNodeCopyWithImpl<$Res>
    implements $ComponentNodeCopyWith<$Res> {
  _$ComponentNodeCopyWithImpl(this._self, this._then);

  final ComponentNode _self;
  final $Res Function(ComponentNode) _then;

  /// Create a copy of ElementNode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? level = null,
    Object? index = null,
    Object? id = null,
    Object? title = null,
    Object? isExpanded = null,
    Object? component = null,
  }) {
    return _then(ComponentNode(
      level: null == level
          ? _self.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      index: null == index
          ? _self.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isExpanded: null == isExpanded
          ? _self.isExpanded
          : isExpanded // ignore: cast_nullable_to_non_nullable
              as bool,
      component: null == component
          ? _self.component
          : component // ignore: cast_nullable_to_non_nullable
              as Component,
    ));
  }
}

/// @nodoc

class DocumentationNode extends ElementNode with DiagnosticableTreeMixin {
  const DocumentationNode(
      {required this.level,
      required this.index,
      required this.id,
      required this.title,
      this.isExpanded = false,
      required this.component,
      required this.document})
      : super._();

  @override
  final int level;
  @override
  final int index;
  @override
  final String id;
  @override
  final String title;
  @override
  @JsonKey()
  final bool isExpanded;
  final Component component;
  final DocumentEntry document;

  /// Create a copy of ElementNode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DocumentationNodeCopyWith<DocumentationNode> get copyWith =>
      _$DocumentationNodeCopyWithImpl<DocumentationNode>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'ElementNode.documentation'))
      ..add(DiagnosticsProperty('level', level))
      ..add(DiagnosticsProperty('index', index))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('isExpanded', isExpanded))
      ..add(DiagnosticsProperty('component', component))
      ..add(DiagnosticsProperty('document', document));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DocumentationNode &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.isExpanded, isExpanded) ||
                other.isExpanded == isExpanded) &&
            (identical(other.component, component) ||
                other.component == component) &&
            (identical(other.document, document) ||
                other.document == document));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, level, index, id, title, isExpanded, component, document);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ElementNode.documentation(level: $level, index: $index, id: $id, title: $title, isExpanded: $isExpanded, component: $component, document: $document)';
  }
}

/// @nodoc
abstract mixin class $DocumentationNodeCopyWith<$Res>
    implements $ElementNodeCopyWith<$Res> {
  factory $DocumentationNodeCopyWith(
          DocumentationNode value, $Res Function(DocumentationNode) _then) =
      _$DocumentationNodeCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int level,
      int index,
      String id,
      String title,
      bool isExpanded,
      Component component,
      DocumentEntry document});
}

/// @nodoc
class _$DocumentationNodeCopyWithImpl<$Res>
    implements $DocumentationNodeCopyWith<$Res> {
  _$DocumentationNodeCopyWithImpl(this._self, this._then);

  final DocumentationNode _self;
  final $Res Function(DocumentationNode) _then;

  /// Create a copy of ElementNode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? level = null,
    Object? index = null,
    Object? id = null,
    Object? title = null,
    Object? isExpanded = null,
    Object? component = null,
    Object? document = null,
  }) {
    return _then(DocumentationNode(
      level: null == level
          ? _self.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      index: null == index
          ? _self.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isExpanded: null == isExpanded
          ? _self.isExpanded
          : isExpanded // ignore: cast_nullable_to_non_nullable
              as bool,
      component: null == component
          ? _self.component
          : component // ignore: cast_nullable_to_non_nullable
              as Component,
      document: null == document
          ? _self.document
          : document // ignore: cast_nullable_to_non_nullable
              as DocumentEntry,
    ));
  }
}

/// @nodoc

class StoryNode extends ElementNode with DiagnosticableTreeMixin {
  const StoryNode(
      {required this.level,
      required this.index,
      required this.id,
      required this.title,
      this.isExpanded = false,
      required this.component,
      required this.story})
      : super._();

  @override
  final int level;
  @override
  final int index;
  @override
  final String id;
  @override
  final String title;
  @override
  @JsonKey()
  final bool isExpanded;
  final Component component;
  final Story story;

  /// Create a copy of ElementNode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StoryNodeCopyWith<StoryNode> get copyWith =>
      _$StoryNodeCopyWithImpl<StoryNode>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'ElementNode.story'))
      ..add(DiagnosticsProperty('level', level))
      ..add(DiagnosticsProperty('index', index))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('isExpanded', isExpanded))
      ..add(DiagnosticsProperty('component', component))
      ..add(DiagnosticsProperty('story', story));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StoryNode &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.isExpanded, isExpanded) ||
                other.isExpanded == isExpanded) &&
            (identical(other.component, component) ||
                other.component == component) &&
            (identical(other.story, story) || other.story == story));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, level, index, id, title, isExpanded, component, story);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ElementNode.story(level: $level, index: $index, id: $id, title: $title, isExpanded: $isExpanded, component: $component, story: $story)';
  }
}

/// @nodoc
abstract mixin class $StoryNodeCopyWith<$Res>
    implements $ElementNodeCopyWith<$Res> {
  factory $StoryNodeCopyWith(StoryNode value, $Res Function(StoryNode) _then) =
      _$StoryNodeCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int level,
      int index,
      String id,
      String title,
      bool isExpanded,
      Component component,
      Story story});
}

/// @nodoc
class _$StoryNodeCopyWithImpl<$Res> implements $StoryNodeCopyWith<$Res> {
  _$StoryNodeCopyWithImpl(this._self, this._then);

  final StoryNode _self;
  final $Res Function(StoryNode) _then;

  /// Create a copy of ElementNode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? level = null,
    Object? index = null,
    Object? id = null,
    Object? title = null,
    Object? isExpanded = null,
    Object? component = null,
    Object? story = null,
  }) {
    return _then(StoryNode(
      level: null == level
          ? _self.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      index: null == index
          ? _self.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isExpanded: null == isExpanded
          ? _self.isExpanded
          : isExpanded // ignore: cast_nullable_to_non_nullable
              as bool,
      component: null == component
          ? _self.component
          : component // ignore: cast_nullable_to_non_nullable
              as Component,
      story: null == story
          ? _self.story
          : story // ignore: cast_nullable_to_non_nullable
              as Story,
    ));
  }
}

// dart format on
