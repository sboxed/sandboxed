import 'package:flutter/material.dart';
import 'package:vibook/addons/addon.dart';
import 'package:vibook/addons/mixins/decorator_addon.dart';
import 'package:vibook/toolbar/toolbar_addon_mixin.dart';
import 'package:vibook_core/decorator.dart';

typedef ThemeBuilder<T> = Widget Function(
  BuildContext context,
  T theme,
  Widget child,
);

/// An [Addon] for changing the active custom theme. A [builder] must be
/// provided that returns an [InheritedWidget] or similar [Widget]s.
final class ThemeAddon<T> extends Addon
    with DecoratorAddon<T>, ToolbarAddonMixin {
  @override
  String get id => 'theme';

  ThemeAddon(this.themes, this.builder);

  final Map<String, T> themes;
  final ThemeBuilder<T> builder;

  @override
  late final notifier = ValueNotifier<T>(themes.values.first);

  @override
  List<Decorator> decorate(BuildContext context) {
    return [
      Decorator(
        (context, story) {
          return ListenableBuilder(
            listenable: notifier,
            builder: (context, child) => builder(
              context,
              notifier.value,
              child!,
            ),
            child: story,
          );
        },
      )
    ];
  }

  @override
  Widget buildEditor(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Theme'),
        const SizedBox(height: 8),
        ListenableBuilder(
          listenable: notifier,
          builder: (context, child) => Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final theme in themes.entries)
                ChoiceChip(
                  label: Text(theme.key),
                  selected: theme.value == notifier.value,
                  onSelected: (value) => notifier.value = theme.value,
                )
            ],
          ),
        ),
      ],
    );
  }

  @override
  List<Widget> get actions {
    return [
      //   Builder(
      //     builder: (context) {
      //       return ToolbarDropdownButton(
      //         items: [
      //           for (final theme in field.values)
      //             MenuItemButton(
      //               onPressed: () => field.updateField(context, groupName, theme),
      //               child: Text(field.labelBuilder(theme)),
      //             ),
      //         ],
      //         tooltip: ToolbarTooltip(message: name),
      //         child: const Icon(Icons.image_sharp),
      //       );
      //     },
      //   ),
    ];
  }
}
