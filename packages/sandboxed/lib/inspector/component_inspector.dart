import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sandboxed/addons/mixins/panel_addon.dart';
import 'package:sandboxed/provider/addons.dart';
import 'package:sandboxed/provider/selected.dart';
import 'package:sandboxed/provider/settings.dart';
import 'package:sandboxed/widgets/tab_actions.dart';

// STOPSHIP(@melvspace): 03/04/25 not params
class ComponentInspector extends ConsumerStatefulWidget {
  final String id;
  final PanelPosition? position;

  const ComponentInspector({
    super.key,
    required this.id,
    required this.position,
  });

  @override
  ConsumerState<ComponentInspector> createState() => _ComponentInspectorState();
}

class _ComponentInspectorState extends ConsumerState<ComponentInspector>
    with TickerProviderStateMixin {
  TabController? _controller;
  TabController? get controller => _controller;
  set controller(TabController? value) {
    _controller?.dispose();
    if (mounted) {
      setState(() => _controller = value);
    } else {
      _controller = value;
    }
  }

  @override
  Widget build(BuildContext context) {
    final addons = ref.watch(
      addonsProvider.select(
        (value) => value.whereType<PanelAddon>().toList(),
      ),
    );

    final selection = ref.watch(selectionProvider(widget.id));
    final positions = ref.watch(
      settingStorageProvider.select((value) => value.positions),
    );

    if (selection case StorySelection(:final component, :final story)) {
      final panels = [
        if (selection case StorySelection())
          for (final addon in addons)
            for (final tab in addon.panels) //
              // if (tab.check(component, story)) //
              if (widget.position == null ||
                  positions[tab.id] == widget.position) //
                tab,
      ];

      if (controller?.length != panels.length) {
        controller = TabController(length: panels.length, vsync: this);
      }

      return Column(
        children: [
          TabBar(
            tabAlignment: TabAlignment.start,
            isScrollable: true,
            controller: controller,
            tabs: [
              for (final panel in panels) //
                TabActions(
                  key: ValueKey(panel.id),
                  panel: panel,
                  child: Tab(
                    child: panel.buildTitle(context, component, story),
                  ),
                ),
            ],
          ),
          Flexible(
            child: ListenableBuilder(
              listenable: controller ?? AlwaysStoppedAnimation(0),
              builder: (context, child) => IndexedStack(
                index: controller?.index,
                children: [
                  for (final panel in panels)
                    panel.buildBody(context, component, story),
                ],
              ),
            ),
          ),
        ],
      );
    }

    return const SizedBox();
  }
}
