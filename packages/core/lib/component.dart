import 'package:equatable/equatable.dart';
import 'package:vibook_core/config.dart';
import 'package:vibook_core/meta.dart';
import 'package:vibook_core/story.dart';

abstract class ViElement with EquatableMixin {
  const ViElement();
}

class Component extends ViElement {
  final Meta meta;
  final Config? config;
  final List<Story> stories;

  const Component({
    required this.meta,
    required this.stories,
    this.config,
  });

  @override
  List<Object?> get props => [meta, stories];
}

// abstract class Document extends ViElement {
//   final String content;

//   Document({required this.content});
// }
