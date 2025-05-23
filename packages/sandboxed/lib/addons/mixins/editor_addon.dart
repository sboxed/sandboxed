import 'package:flutter/widgets.dart';
import 'package:sandboxed/addons/addon.dart';
import 'package:sandboxed_core/sandboxed_core.dart';

base mixin EditorAddon on Addon {
  Widget? visitComponentTitle(
    BuildContext context,
    Component component,
    Widget title,
  ) {
    return null;
  }

  Widget? visitComponentIcon(
    BuildContext context,
    Component component,
    Widget icon,
  ) {
    return null;
  }

  Widget? visitStoryTitle(
    BuildContext context,
    Component component,
    Story story,
    Widget title,
  ) {
    return null;
  }

  Widget? visitStoryIcon(
    BuildContext context,
    Component component,
    Story story,
    Widget icon,
  ) {
    return null;
  }
}
