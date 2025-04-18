import 'package:flutter/material.dart';
import 'package:sandboxed/addons/typed_addons/flag_addon.dart';
import 'package:sandboxed/toolbar/toolbar_addon_mixin.dart';
import 'package:sandboxed/toolbar/toolbar_button.dart';
import 'package:sandboxed_core/decorator.dart';

final class InteractiveViewerAddon extends FlagAddon with ToolbarAddonMixin {
  final bool constrained;
  final double minScale;
  final double maxScale;

  InteractiveViewerAddon({
    this.constrained = true,
    this.minScale = 0.1,
    this.maxScale = 5,
  });

  @override
  String get id => 'interactive_viewer';

  @override
  String get name => "Interactive Viewer";

  @override
  List<Widget> get actions {
    return [
      ListenableBuilder(
        listenable: this,
        builder: (context, _) {
          return ToolbarButton(
            selected: value,
            onPressed: () => value = !value,
            tooltip: const ToolbarTooltip(message: 'Pan Tool'),
            child: Icon(value ? Icons.pan_tool : Icons.pan_tool_outlined),
          );
        },
      ),
    ];
  }

  @override
  List<Decorator> decorate(BuildContext context) {
    return [
      Decorator(
        (context, story) {
          return LayoutBuilder(
            builder: (context, constraints) => ListenableBuilder(
              listenable: this,
              builder: (context, child) {
                if (value) {
                  return InteractiveViewer(
                    maxScale: maxScale,
                    minScale: minScale,
                    constrained: constrained,
                    boundaryMargin: EdgeInsets.symmetric(
                      horizontal: constraints.maxWidth,
                      vertical: constraints.maxHeight,
                    ),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border.all(
                          strokeAlign: BorderSide.strokeAlignOutside,
                          color: Theme.of(context).colorScheme.surfaceBright,
                        ),
                      ),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minWidth: constraints.maxWidth,
                          minHeight: constraints.maxHeight,
                        ),
                        child: child!,
                      ),
                    ),
                  );
                }
                return child!;
              },
              child: story,
            ),
          );
        },
      )
    ];
  }
}
