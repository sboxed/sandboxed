import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vibook/provider/brand_color.dart';
import 'package:vibook/provider/selected.dart';
import 'package:vibook/router.gr.dart';
import 'package:vibook/widgets/vi_drawer.dart';
import 'package:vibook_core/component.dart';

class MobileLayout extends StatefulWidget {
  final List<ViElement> components;

  const MobileLayout({
    super.key,
    required this.components,
  });

  @override
  State<MobileLayout> createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.endContained,
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {},
            backgroundColor: ref.watch(brandColorProvider),
            foregroundColor: Colors.white,
            label: const Text("Share"),
          ),
          drawer: const ViDrawer(),
          body: AutoRouter.declarative(
            routes: (handler) => [
              switch (ref.watch(selectedElementProvider)) {
                null => const NothingRoute(),
                DocumentSelection() => DocumentRoute(
                    id: ref.watch(selectedElementNotifierProvider)!,
                  ),
                StorySelection() => StoryRoute(
                    id: ref.watch(selectedElementNotifierProvider)!,
                  ),
              },
            ],
          ),
        );
      },
    );
  }
}
