import 'package:flutter/material.dart';
import 'package:iconify_flutter_plus/icons/mdi.dart';
import 'package:vibook/inspector/addons_inspector.dart';
import 'package:vibook/inspector/knobs_inspector.dart';
import 'package:vibook/widgets/story_name.dart';
import 'package:vibook/widgets/vi_icon.dart';

class ViBottomAppBar extends StatelessWidget {
  const ViBottomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        children: <Widget>[
          IconButton(
            tooltip: 'Open navigation menu',
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
          IconButton(
            tooltip: 'Knobs',
            icon: const ViIcon(Mdi.rhombus_split),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppBar(
                        title: const StoryName(),
                        backgroundColor: Colors.transparent,
                      ),
                      const SizedBox(height: 12),
                      const Flexible(
                        child: KnobsInspector(),
                      ),
                    ],
                  );
                },
              );
            },
          ),
          IconButton(
            tooltip: 'Addons',
            icon: const Icon(Icons.settings),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Column(
                    children: [
                      AppBar(
                        title: Text("Addons"),
                        backgroundColor: Colors.transparent,
                      ),
                      const SizedBox(height: 12),
                      Flexible(
                        child: const AddonsInspector(),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
