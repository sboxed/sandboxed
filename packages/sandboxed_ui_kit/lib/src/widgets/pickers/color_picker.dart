import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sandboxed_ui_kit/src/utility/hex_color.dart';

class SBColorPicker extends StatefulWidget {
  final Color value;
  final ValueChanged<Color>? onChanged;

  const SBColorPicker({
    super.key,
    required this.value,
    this.onChanged,
  });

  @override
  State<SBColorPicker> createState() => _SBColorPickerState();
}

class _SBColorPickerState extends State<SBColorPicker> {
  late final textController = TextEditingController(text: widget.value.hex);
  final overlayController = OverlayPortalController();
  final node = FocusNode();
  final link = LayerLink();

  bool isInteracting = false;

  bool get isEditable => widget.onChanged != null;

  @override
  void didUpdateWidget(covariant SBColorPicker oldWidget) {
    if (!isEditable && overlayController.isShowing) {
      overlayController.hide();
    }

    if (!node.hasFocus && !textController.text.contains(widget.value.hex)) {
      textController.text = widget.value.hex;
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = widget.value;
    final hsv = HSVColor.fromColor(color);

    return Row(
      children: [
        OverlayPortal.targetsRootOverlay(
          controller: overlayController,
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
                    padding: const EdgeInsets.all(3.0),
                    child: Container(
                      width: 32,
                      height: 32,
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
        ),
        const SizedBox(width: 12),
        if (isEditable)
          Flexible(
            child: TextField(
              focusNode: node,
              controller: textController,
              onChanged: (value) {
                try {
                  widget.onChanged?.call(HexColor(value));
                } catch (_) {/* ignore parse errors */}
              },
              inputFormatters: [
                ColorHexFormatter(),
              ],
              decoration: const InputDecoration.collapsed(
                hintText: 'HEX Color',
              ),
            ),
          )
        else
          Text('#${color.hex}'),
      ],
    );
  }
}

class ColorHexFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.replaceAll('#', '').length > 8) {
      return oldValue;
    }

    if (newValue.text.contains(RegExp(r'[^#a-f\d]'))) {
      return oldValue;
    }

    if (newValue.text.contains(RegExp(r'#?.+#'))) {
      return oldValue;
    }

    return newValue;
  }
}
