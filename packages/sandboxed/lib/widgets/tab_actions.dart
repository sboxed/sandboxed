import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sandboxed/addons/mixins/panel_addon.dart';
import 'package:sandboxed/provider/settings.dart';
import 'package:sandboxed/sandboxed.dart';

class TabActions extends StatefulWidget {
  final Panel panel;
  final Widget child;

  const TabActions({
    super.key,
    required this.panel,
    required this.child,
  });

  @override
  State<TabActions> createState() => _TabActionsState();
}

class _TabActionsState extends State<TabActions> {
  final _controller = MenuController();

  @override
  Widget build(BuildContext context) {
    if (context.breakpoint == Breakpoints.mobile) {
      return widget.child;
    }

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onSecondaryTapDown: (_) {
        _controller.open();
      },
      child: Consumer(
        builder: (context, ref, child) {
          final position =
              ref.watch(settingStorageProvider).positions[widget.panel.id] ??
                  PanelPosition.bottom;

          return MenuAnchor(
            controller: _controller,
            menuChildren: [
              MenuItemButton(
                child: Text("Move to ${position.opposite.name}"),
                onPressed: () {
                  _controller.close();

                  ref.read(settingStorageProvider.notifier).update(
                    (current) {
                      return current.copyWith(
                        positions: {
                          ...current.positions,
                          widget.panel.id: position.opposite,
                        },
                      );
                    },
                  );
                },
              ),
            ],
            child: widget.child,
          );
        },
      ),
    );
  }
}
