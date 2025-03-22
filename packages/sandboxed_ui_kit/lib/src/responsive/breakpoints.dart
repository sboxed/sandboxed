import 'package:flutter/material.dart';
import 'package:sandboxed_ui_kit/src/widgets/widgets.dart';

enum Breakpoints { mobile, desktop }

extension BreakpointsBuildContextX on BuildContext {
  Breakpoints get breakpoint {
    final width = MediaQuery.sizeOf(this).width;
    switch (width) {
      case < (900 + kDividerWidth * 2):
        return Breakpoints.mobile;

      default:
        return Breakpoints.desktop;
    }
  }
}
