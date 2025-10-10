import 'package:sandboxed/addons/addon.dart';
import 'package:sandboxed/addons/mixins/param_editor_addon.dart';
import 'package:sandboxed/params/factories/default_param_editor_factory.dart';
import 'package:sandboxed/params/factories/flutter_param_editor_factory.dart';

final class DefaultParamEditorAddon extends Addon with ParamEditorAddon {
  @override
  String get id => 'base_param_editors';

  DefaultParamEditorAddon();

  @override
  get editors3 => [
        DefaultParamEditorFactory(),
        FlutterParamEditorFactory(),
      ];
}
