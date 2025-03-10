import 'package:flutter/widgets.dart';
import 'package:vibook/addons/addon.dart';
import 'package:vibook_core/vibook_core.dart';

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
