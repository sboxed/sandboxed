import 'package:vibook_core/component.dart';
import 'package:vibook_sandbox/widgets/button.stories.dart' as button;
import 'package:vibook_sandbox/widgets/diagrams/button.stories.dart' as dbutton;
import 'package:vibook_sandbox/widgets/diagrams/card.stories.dart' as dcard;
import 'package:vibook_sandbox/widgets/header.stories.dart' as header;

final components = [
  Component(
    meta: () => button.meta,
    stories: [
      () => button.$Blue,
      () => button.$Green,
    ],
  ),
  Component(
    meta: () => header.meta,
    stories: [
      () => header.$Default,
    ],
  ),
  Component(
    meta: () => dbutton.meta,
    stories: [
      () => dbutton.$Blue,
      () => dbutton.$Green,
    ],
  ),
  Component(
    meta: () => dcard.meta,
    stories: [
      () => dcard.$Blue,
      () => dcard.$Green,
    ],
  ),
];
