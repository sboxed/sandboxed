import 'dart:collection';
import 'dart:developer';

import 'package:sandboxed_core/sandboxed_core.dart';
import 'package:sandboxed_core/src/params/use_params.dart';

class DefaultValueResolver {
  final Params params;
  final Map<String, dynamic> defaultValues;

  DefaultValueResolver({
    required this.params,
    required Map<String, dynamic> defaultValues,
  }) : defaultValues = UnmodifiableMapView({...defaultValues});

  /// Retrieves a default value for a parameter based on its type and registered default values.
  ///
  /// This method handles type casting and conversion for various default value scenarios:
  /// - Uses [UseParams] to dynamically build parameter values
  /// - Converts numeric types
  /// - Casts collections like sets, lists, and maps
  ///
  /// Returns the converted default value or null if conversion is not possible.
  ///
  /// [T] represents the target parameter type
  /// [T1] and [T2] are optional type parameters for collection type casting
  ///
  /// Logs a warning if an uncastable default value is encountered
  T? getDefaultValue<T, T1, T2>(String id) {
    final voidType = (<T>() => T)<void>();
    return switch (defaultValues[id]) {
      // TODO(@melvspace): 03/09/25 link param wrappers to update each other
      UseParams useParams => useParams.builder(params),
      num number when T == double => number.toDouble(),
      dynamic value when value is T => value,
      Set set when T1 != voidType => set.cast<T1>().toSet(),
      Iterable iterable when T1 != voidType => iterable.cast<T1>().toList(),
      Map map when T1 != voidType && T2 != voidType => map.cast<T1, T2>(),
      dynamic value => () {
          log('Uncastable default value received ($id: $value of [${value.runtimeType}] type when [$T] type expected)');
          return null;
        }(),
    };
  }
}
