import 'package:equatable/equatable.dart';
import 'package:sandboxed_core/config.dart';
import 'package:sandboxed_core/meta.dart';
import 'package:sandboxed_core/story.dart';

abstract class SandboxedElement with EquatableMixin {
  const SandboxedElement();
}

class Component extends SandboxedElement {
  final Meta meta;
  final Config? config;
  final List<Story> stories;

  const Component({
    required this.meta,
    required this.stories,
    this.config,
  });

  String? get module {
    final value = [config?.module, meta.module].whereType<String>().join('/');
    if (value.trim().isEmpty) return null;

    return value.trim();
  }

  @override
  List<Object?> get props => [meta, stories];
}
