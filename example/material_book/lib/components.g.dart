import 'package:vibook_core/component.dart';
import 'package:material_book/widgets/bottom_app_bar.stories.dart'
    as widgets_bottom_app_bar;
import 'package:material_book/widgets/bottom_navigation_bar.stories.dart'
    as widgets_bottom_navigation_bar;
import 'package:material_book/widgets/chips.stories.dart' as widgets_chips;

final components = <Component>[
  Component(
    meta: () => widgets_bottom_app_bar.meta,
    stories: [
      () => widgets_bottom_app_bar.$Default,
    ],
  ),
  Component(
    meta: () => widgets_bottom_navigation_bar.meta,
    stories: [
      () => widgets_bottom_navigation_bar.$Default,
    ],
  ),
  Component(
    meta: () => widgets_chips.meta,
    stories: [
      () => widgets_chips.$Chip,
      () => widgets_chips.$InputChip,
      () => widgets_chips.$ChoiceChip,
      () => widgets_chips.$FilterChip,
      () => widgets_chips.$ActionChip,
    ],
  ),
];
