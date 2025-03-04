import 'package:flutter/widgets.dart';
import 'package:vibook_core/meta.dart';
import 'package:vibook_core/story.dart';

class Component {
  final ValueGetter<Meta> meta;
  final List<ValueGetter<Story>> stories;

  const Component({
    required this.meta,
    required this.stories,
  });
}
