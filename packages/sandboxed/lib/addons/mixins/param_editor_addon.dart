import 'package:sandboxed/addons/addon.dart';
import 'package:sandboxed_core/sandboxed_core.dart';

base mixin ParamEditorAddon on Addon {
  List<ParamEditorFactory<ValueEditorPresenter<dynamic>?>> get editors3;
}
