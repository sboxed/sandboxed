import 'package:flutter/widgets.dart';
import 'package:vibook_core/meta.dart';
import 'package:vibook_core/story.dart';

abstract class ViElement {
  const ViElement();
}

class Component extends ViElement {
  final ValueGetter<Meta> meta;
  final List<ValueGetter<Story>> stories;

  const Component({
    required this.meta,
    required this.stories,
  });
}

abstract class Document extends ViElement {
  final String content;

  Document({required this.content});
}
