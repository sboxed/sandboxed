import 'package:flutter/material.dart';
import 'package:sandboxed/addons/addon.dart';

base mixin ToolbarAddonMixin on Addon {
  List<Widget> get actions;
}
