import 'package:equatable/equatable.dart';
import 'package:vibook_core/meta.dart';
import 'package:vibook_core/story.dart';

abstract class ViElement with EquatableMixin {
  const ViElement();
}

class Component extends ViElement {
  final Meta meta;
  final List<Story> stories;

  const Component({
    required this.meta,
    required this.stories,
  });

  @override
  List<Object?> get props => [meta, stories];
}

// abstract class Document extends ViElement {
//   final String content;

//   Document({required this.content});
// }
