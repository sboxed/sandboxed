import 'package:flutter/material.dart';
import 'package:vibook/addons/addon.dart';

base mixin ToolbarAddonMixin<T> on Addon<T> {
  List<Widget> get actions;
}
