import 'package:flutter/material.dart';
import 'package:iconify_flutter_plus/icons/mdi.dart';
import 'package:vibook_ui_kit/src/widgets/vi_icon.dart';

enum ElementTileIcons {
  // Meta
  warning(ViIcon(Mdi.warning_circle, color: Colors.red)),

  // Tree
  module(ViIcon(Mdi.cube)),
  folder(ViIcon(Mdi.folder)),
  folderOpen(ViIcon(Mdi.folder_open)),
  component(ViIcon(Mdi.rhombus_split)),
  document(ViIcon(Mdi.file_certificate)),
  story(ViIcon(Mdi.rhombus));

  final Widget icon;

  const ElementTileIcons(this.icon);
}
