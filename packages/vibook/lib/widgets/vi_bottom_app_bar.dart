import 'package:flutter/material.dart';
import 'package:iconify_flutter_plus/icons/mdi.dart';
import 'package:vibook/inspector/addons_inspector.dart';
import 'package:vibook/inspector/component_inspector.dart';
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
            tooltip: 'Params',
            icon: const ViIcon(Mdi.rhombus_split),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => const ComponentInspector(),
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
                        title: const Text("Addons"),
                        backgroundColor: Colors.transparent,
                      ),
                      const SizedBox(height: 12),
                      const Flexible(
                        child: AddonsInspector(),
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
