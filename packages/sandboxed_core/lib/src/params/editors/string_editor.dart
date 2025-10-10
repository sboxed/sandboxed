import 'package:sandboxed_core/src/params/param_editor.dart';

class StringEditor extends ParamEditor<String> {
  final int? minLines;
  final int? maxLines;

  const StringEditor({
    this.minLines,
    this.maxLines = 1,
  });
}
