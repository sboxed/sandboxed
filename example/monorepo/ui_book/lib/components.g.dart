import 'package:vibook_core/component.dart';
import 'package:ui_kit/button.stories.dart' as button;

final components = <Component>[
  Component(
    meta: () => button.meta,
    stories: [
      () => button.$Green,
      () => button.$Blue,
    ],
  )
];
