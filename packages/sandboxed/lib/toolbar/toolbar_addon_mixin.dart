import 'package:material_ui/material_ui.dart';
import 'package:sandboxed/addons/addon.dart';

base mixin ToolbarAddonMixin on Addon {
  List<Widget> get actions;
}
