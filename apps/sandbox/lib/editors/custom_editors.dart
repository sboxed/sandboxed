import 'package:flutter/material.dart';
import 'package:sandbox_feature/sandbox_feature.dart';
import 'package:sandboxed/addons/addon.dart';
import 'package:sandboxed/addons/mixins/param_editor_addon.dart';
import 'package:sandboxed_core/sandboxed_core.dart';

final class CustomEditorsAddon extends Addon with ParamEditorAddon {
  @override
  String get id => "custom_editors";

  @override
  List<ParamEditorFactory<ValueEditorPresenter?>> get editors3 => [
        CustomEditorFactory(),
      ];
}

class CustomEditorFactory extends ParamEditorFactory<ValueEditorPresenter?> {
  @override
  ValueEditorPresenter? create<T>(ParamEditor<T> e) {
    switch (e) {
      case EnumDropdownEditor<T> editor:
        return EnumDropdownEditorPresenter<T>(editor: editor);

      default:
        return null;
    }
  }
}

class EnumDropdownEditorPresenter<T> extends ValueEditorPresenter<T> {
  final EnumDropdownEditor<T> editor;

  const EnumDropdownEditorPresenter({required this.editor});

  @override
  Widget build(BuildContext context, ParamValue<T> value) {
    return DropdownButton<T>(
      padding: EdgeInsets.symmetric(horizontal: 8),
      items: [
        for (final item in editor.values) //
          DropdownMenuItem(
            enabled: value.value != item,
            value: item,
            child: Text(
              editor.labelBuilder(item),
            ),
          ),
      ],
      onChanged: (nextValue) => value.update(nextValue),
      value: value.value,
    );
  }
}
