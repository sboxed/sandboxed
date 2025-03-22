import 'package:flutter/material.dart';
import 'package:iconify_flutter_plus/icons/mdi.dart';
import 'package:sandboxed_ui_kit/sandboxed_ui_kit.dart';

enum ElementTileIcons {
  // Meta
  warning(SBIcon(Mdi.warning_circle, color: Colors.red)),

  // Tree
  module(SBIcon(Mdi.cube)),
  folder(SBIcon(Mdi.folder)),
  folderOpen(SBIcon(Mdi.folder_open)),
  component(SBIcon(Mdi.rhombus_split)),
  document(SBIcon(Mdi.file_certificate)),
  story(SBIcon(Mdi.rhombus));

  final Widget icon;

  const ElementTileIcons(this.icon);
}
