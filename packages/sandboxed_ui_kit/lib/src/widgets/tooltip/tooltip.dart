import 'dart:math';

import 'package:flutter/material.dart';

enum SBTooltipPosition {
  top,
  bottom,
  left,
  right,
}

class SBTooltip extends StatefulWidget {
  final Widget child;
  final Widget tooltip;
  final SBTooltipPosition? position;
  final bool constrained;

  const SBTooltip({
    super.key,
    required this.child,
    required this.tooltip,
    this.position,
    this.constrained = false,
  });

  @override
  State<SBTooltip> createState() => _SBTooltipState();
}

class _SBTooltipState extends State<SBTooltip>
    with SingleTickerProviderStateMixin {
  final LayerLink layerLink = LayerLink();
  final OverlayPortalController controller = OverlayPortalController();
  late final AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(vsync: this);

    super.initState();
  }

  void show() {
    controller.show();

    animationController.duration = const Duration(milliseconds: 200);
    animationController.forward();
  }

  Future<void> hide() async {
    await animationController.reverse();
    controller.hide();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return OverlayPortal.targetsRootOverlay(
      controller: controller,
      overlayChildBuilder: (overlayContext) {
        final translation = context
            .findRenderObject() //
            ?.getTransformTo(null)
            .getTranslation();

        final position = widget.position ??
            () {
              final toTop = (translation?.y ?? 0) >
                  MediaQuery.sizeOf(overlayContext).height / 2;

              if (toTop) {
                return SBTooltipPosition.top;
              } else {
                return SBTooltipPosition.bottom;
              }
            }();

        final target = switch (position) {
          SBTooltipPosition.top => Alignment.bottomCenter,
          SBTooltipPosition.bottom => Alignment.topCenter,
          SBTooltipPosition.left => Alignment.centerRight,
          SBTooltipPosition.right => Alignment.centerLeft,
        };

        final follower = -target;

        return CompositedTransformFollower(
          link: layerLink,
          targetAnchor: follower,
          followerAnchor: target,
          child: IgnorePointer(
            child: Align(
              alignment: target,
              child: FadeTransition(
                opacity: animationController,
                child: Padding(
                  padding: EdgeInsetsGeometry.all(8),
                  child: ConstrainedBox(
                    constraints: widget.constrained
                        ? BoxConstraints(
                            maxWidth: max(
                              layerLink.leaderSize?.width ?? 390,
                              390,
                            ),
                          )
                        : BoxConstraints(),
                    child: Card(
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: widget.tooltip,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
      child: CompositedTransformTarget(
        link: layerLink,
        child: MouseRegion(
          onEnter: (event) => show(),
          onExit: (event) => hide(),
          child: widget.child,
        ),
      ),
    );
  }
}
