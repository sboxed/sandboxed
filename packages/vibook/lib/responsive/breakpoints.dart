import 'package:flutter/material.dart';
import 'package:vibook/widgets/resizable_divider.dart';

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
