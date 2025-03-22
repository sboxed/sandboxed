import 'package:flutter/material.dart';

import 'toolbar_button.dart';

class ToolbarOverlayButton extends StatefulWidget {
  const ToolbarOverlayButton({
    super.key,
    required this.child,
    required this.overlay,
    this.tooltip,
  });

  final Widget child;
  final ToolbarTooltip? tooltip;
  final WidgetBuilder overlay;

  @override
  State<ToolbarOverlayButton> createState() => _ToolbarOverlayButtonState();
}

class _ToolbarOverlayButtonState extends State<ToolbarOverlayButton> {
  final OverlayPortalController controller = OverlayPortalController();

  void handlePressed() {
    if (controller.isShowing) {
      controller.hide();
    } else {
      controller.show();
    }
  }

  @override
  Widget build(BuildContext context) {
    return OverlayPortal(
      controller: controller,
      overlayChildBuilder: (context) {
        final OverlayState overlayState = Overlay.of(
          context,
          debugRequiredFor: widget,
        );

        final RenderBox box = this.context.findRenderObject()! as RenderBox;
        final Offset target = box.localToGlobal(
          box.size.center(Offset.zero),
          ancestor: overlayState.context.findRenderObject(),
        );

        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: controller.isShowing ? () => controller.hide() : null,
          child: Overlay(
            clipBehavior: Clip.none,
            initialEntries: [
              OverlayEntry(
                builder: (context) {
                  return Positioned(
                    left: target.dx - box.size.width,
                    top: target.dy + box.size.height / 2 + 16,
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 300),
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: widget.overlay(context),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
      child: ToolbarButton(
        onPressed: handlePressed,
        tooltip: widget.tooltip,
        child: widget.child,
      ),
    );
  }
}
