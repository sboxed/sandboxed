import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';

class ColorBoxPicker extends StatefulWidget {
  static const kPadding = 3.0;
  static double getSizeFor(double size) => size + kPadding * 2;

  final Color color;
  final ValueChanged<Color>? onChanged;

  final double size;

  const ColorBoxPicker({
    super.key,
    required this.color,
    this.onChanged,
    this.size = 32,
  });

  @override
  State<ColorBoxPicker> createState() => _ColorBoxPickerState();
}

class _ColorBoxPickerState extends State<ColorBoxPicker> {
  final overlayController = OverlayPortalController();
  final link = LayerLink();

  bool get isEditable => widget.onChanged != null;

  bool isInteracting = false;

  @override
  Widget build(BuildContext context) {
    final color = widget.color;
    final hsv = HSVColor.fromColor(color);

    return OverlayPortal(
      controller: overlayController,
      overlayLocation: OverlayChildLocation.rootOverlay,
      overlayChildBuilder: (BuildContext context) {
        if (!isEditable) {
          return const SizedBox();
        }

        return CompositedTransformFollower(
          link: link,
          targetAnchor: Alignment.topCenter,
          followerAnchor: Alignment.bottomCenter,
          child: SafeArea(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: MouseRegion(
                onEnter: (event) => isInteracting = true,
                onExit: (event) => isInteracting = false,
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: SizedBox(
                    width: 300,
                    child: IntrinsicHeight(
                      child: ColorPicker(
                        color: color,
                        pickersEnabled: const {ColorPickerType.wheel: true},
                        onColorChanged: widget.onChanged!,
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
        link: link,
        child: TapRegion(
          onTapOutside: (event) {
            if (isInteracting) return;
            overlayController.hide();
          },
          child: MouseRegion(
            cursor: isEditable //
                ? SystemMouseCursors.click
                : MouseCursor.defer,
            child: GestureDetector(
              onTap: isEditable //
                  ? () => overlayController.toggle()
                  : null,
              child: Padding(
                padding: const EdgeInsets.all(ColorBoxPicker.kPadding),
                child: Container(
                  width: widget.size,
                  height: widget.size,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      width: 3,
                      color: hsv
                          .withValue(hsv.value < .25 ? .3 : hsv.value * .5)
                          .toColor(),
                      strokeAlign: BorderSide.strokeAlignOutside,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
