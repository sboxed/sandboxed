import 'package:sandboxed_core/sandboxed_core.dart';
import 'package:sandboxed_core/src/params/param_serializer.dart';

extension JsonParamsX on ParamStorage {
  ParamBuilder<T> json<T>(
    String id, {
    required T Function(Map<String, dynamic> json) fromJson,
    required Map<String, dynamic> Function(T value) toJson,
  }) {
    return ParamBuilder<T>(id) //
        .store(this)
        .serializable(
          ParamSerializer(
            serialize: (value) => value == null ? null : toJson(value),
            deserialize: (json) => fromJson(json),
          ),
        )
        .editor(JsonEditor(fromJson: fromJson, toJson: toJson));
  }
}
