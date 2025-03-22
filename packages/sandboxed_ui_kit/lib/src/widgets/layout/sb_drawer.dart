import 'package:flutter/material.dart';
import 'package:sandboxed_ui_kit/sandboxed_ui_kit.dart';

class SBDrawer extends StatelessWidget {
  final Widget title;
  final List<Widget> actions;
  final Widget body;

  const SBDrawer({
    super.key,
    required this.title,
    required this.actions,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: SandboxedTheme.of(context).brandColor,
            padding: const EdgeInsets.only(
              left: 16,
              right: 8,
              top: 4,
              bottom: 4,
            ),
            child: SafeArea(
              bottom: false,
              child: Row(
                children: [
                  Expanded(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.topLeft,
                      child: DefaultTextStyle.merge(
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                        child: title,
                      ),
                    ),
                  ),
                  ...actions,
                ],
              ),
            ),
          ),
          Expanded(child: body),
        ],
      ),
    );
  }
}
