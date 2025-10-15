import 'package:flutter/material.dart';
import 'package:sandboxed/sandboxed.dart';

/// Base mixin for addons that want to add custom tabs to the inspector.
base mixin class PanelAddon {
  List<Panel> get panels => [];
}

abstract class Panel<TPanelAddon extends PanelAddon> {
  final TPanelAddon addon;

  String get id;

  const Panel(this.addon);

  // TODO(@melvspace): 10/16/25 to allow tabs to be filtered we need a way to know result ahead to hide/show sidebar
  // bool check(Component component, Story story) => true;

  Widget buildTitle(BuildContext context, Component component, Story story);

  Widget buildBody(BuildContext context, Component component, Story story);
}
