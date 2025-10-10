import 'package:sandboxed_core/src/params/param_editor.dart';
import 'package:sandboxed_core/src/src.dart';

typedef ToJson<T> = Map<String, dynamic> Function(T value);
typedef FromJson<T> = T Function(Map<String, dynamic> json);

// TODO(@melvspace): 10/11/25 support json schema?
class JsonEditor<T> extends ParamEditor<T> {
  final ToJson<T> toJson;
  final FromJson<T> fromJson;

  const JsonEditor({required this.toJson, required this.fromJson});
}
