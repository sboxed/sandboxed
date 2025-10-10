import 'package:sandboxed_core/src/params/param_editor.dart';

/// Creates a presenter from [ParamEditor]
///
/// Supports:
/// - [ParamEditor]
/// - [ListParamEditor]
abstract class ParamEditorFactory<R> {
  const ParamEditorFactory();

  /// Used for creating simple editors
  ///
  /// Examples:
  /// - `ParamEditor<bool>` where [T] is [bool]
  /// - `ParamEditor<String>` where [T] is [String]
  R create<T>(ParamEditor<T> e);

  /// Used for creating editors which are wrapping generic types into List
  ///
  /// Restores the generic type of [TItem]
  ///
  /// Examples:
  /// - `ParamEditor<List<String>>` where [TItem] is [String]
  R createListEditor<TItem>(ListParamEditor<TItem> e) => create(e);
}
