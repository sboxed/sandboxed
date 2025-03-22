import 'package:flutter/material.dart';
import 'package:flutter_resizable_container/flutter_resizable_container.dart';

const kDividerWidth = 5;
ResizableDivider buildResizableDivider(BuildContext context) {
  return ResizableDivider(
    color: Theme.of(context).colorScheme.surfaceContainer,
    thickness: 5,
  );
}
