import 'package:vibook_core/component.dart';
import 'package:vibook_sandbox/widgets/button.stories.dart' as widgets_button;
import 'package:vibook_sandbox/widgets/header.stories.dart' as widgets_header;
import 'package:vibook_sandbox/widgets/diagrams/button.stories.dart'
    as widgets_diagrams_button;
import 'package:vibook_sandbox/widgets/diagrams/card.stories.dart'
    as widgets_diagrams_card;

final components = <Component>[
  Component(
    meta: () => widgets_button.meta,
    stories: [
      () => widgets_button.$Green,
      () => widgets_button.$Blue,
    ],
  ),
  Component(
    meta: () => widgets_header.meta,
    stories: [
      () => widgets_header.$Default,
    ],
  ),
  Component(
    meta: () => widgets_diagrams_button.meta,
    stories: [
      () => widgets_diagrams_button.$Green,
      () => widgets_diagrams_button.$Blue,
    ],
  ),
  Component(
    meta: () => widgets_diagrams_card.meta,
    stories: [
      () => widgets_diagrams_card.$Green,
      () => widgets_diagrams_card.$Blue,
    ],
  ),
];
