import 'package:flutter/widgets.dart';
import 'package:sandboxed/addons/addon.dart';
import 'package:sandboxed/addons/mixins/explorer_addon.dart';
import 'package:sandboxed/widgets/gap.dart';
import 'package:sandboxed_core/sandboxed_core.dart';

typedef TagBuilder = Widget? Function(BuildContext context, String tag);

final class TagsRendererAddon extends Addon with ExplorerAddon {
  final TagBuilder buildTag;

  TagsRendererAddon({required this.buildTag});

  @override
  String get id => 'tags_renderer';

  @override
  Widget? visitComponentTitle(
    BuildContext context,
    Component component,
    Widget title,
  ) {
    final widgets = component.meta.tags //
        .map((e) => buildTag(context, e))
        .whereType<Widget>()
        .toList();

    if (widgets.isEmpty) return null;

    return Row(
      children: [
        title,
        const Gap(12),
        ...widgets,
      ],
    );
  }

  @override
  Widget? visitStoryTitle(
    BuildContext context,
    Component component,
    Story story,
    Widget title,
  ) {
    final widgets = story.tags //
        .map((e) => buildTag(context, e))
        .whereType<Widget>()
        .toList();

    if (widgets.isEmpty) return null;

    return Row(
      children: [
        title,
        const Gap(12),
        ...widgets,
      ],
    );
  }
}
