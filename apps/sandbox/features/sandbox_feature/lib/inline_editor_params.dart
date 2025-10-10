import 'package:flutter/widgets.dart';
import 'package:sandbox_feature/src/key_value_editor.dart';
import 'package:sandboxed_core/sandboxed_core.dart';

extension MapParamsX on ParamStorage {
  ParamBuilder<Map<String, dynamic>> dictionary(String id) {
    return ParamBuilder<Map<String, dynamic>>(id) //
        .store(this)
        .editor(KeyValueEditor());
  }
}

class KeyValueEditor extends ParamEditor<Map<String, dynamic>> with ValueEditorPresenter<Map<String, dynamic>> {
  @override
  Widget build(BuildContext context, ParamValue<Map<String, dynamic>> value) {
    return KeyValueEditorWidget(
      type: ValueType.object,
      value: value.value,
      onChange: (nextValue) => value.update(
        (nextValue as Map).cast<String, dynamic>(),
      ),
    );
  }
}
