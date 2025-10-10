import 'package:flutter/material.dart';
import 'package:sandboxed_core/sandboxed_core.dart';
import 'package:sandboxed_core/src/params/param_serializer.dart';

extension BooleanParamsX on ParamStorage {
  ParamBuilder<bool> boolean(String id) {
    return ParamBuilder<bool>(id) //
        .store(this)
        .serializable(ParamSerializer.identity())
        .editor(BooleanEditor());
  }
}

extension BooleanEditorsX on ParamBuilder<bool> {
  ParamBuilder<bool> checkbox() {
    return editor(_CheckboxEditor());
  }
}

class _CheckboxEditor extends ParamEditor<bool>
    with ValueEditorPresenter<bool> {
  @override
  Widget build(BuildContext context, ParamValue<bool> value) {
    return Checkbox(
      value: value.value,
      tristate: !value.required,
      onChanged: (nextValue) => value.update(nextValue),
    );
  }
}
