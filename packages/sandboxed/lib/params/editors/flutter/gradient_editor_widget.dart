import 'package:flutter/material.dart';
import 'package:sandboxed/sandboxed.dart';
import 'package:sandboxed/widgets/internal/utility/skip_frame.dart';

class GradientEditorPresenter extends ValueEditorPresenter<Gradient> {
  final ParamEditor<Gradient> editor;

  const GradientEditorPresenter(this.editor);

  @override
  Widget build(BuildContext context, ParamValue<Gradient> value) {
    return GradientEditorWidget(value: value);
  }
}

double _relative(double value) => value / 2.0 + 0.5;

class GradientEditorWidget extends StatefulWidget {
  final double size;
  final ParamValue<Gradient> value;

  const GradientEditorWidget({
    super.key,
    required this.value,
    this.size = 256,
  });

  @override
  State<GradientEditorWidget> createState() => _GradientEditorWidgetState();
}

class _GradientEditorWidgetState extends State<GradientEditorWidget> {
  bool _editHandles = false;
  set editHandles(bool value) => mounted && _editHandles != value
      ? setState(() => _editHandles = value)
      : null;
  bool get editHandles => _editHandles;

  TapDownDetails? _tapDownDetails;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            SizedBox.square(
              dimension: widget.size,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: widget.value.value,
                ),
              ),
            ),
            SizedBox.square(
              dimension: widget.size,
              child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () => editHandles = !editHandles,
                  icon: Icon(
                      editHandles ? Icons.check : Icons.linear_scale_rounded),
                ),
              ),
            ),
            ...switch (widget.value.value) {
              LinearGradient gradient => () {
                  final begin =
                      gradient.begin.resolve(Directionality.of(context));
                  final end = gradient.end.resolve(Directionality.of(context));

                  if (!editHandles) {
                    return [];
                  }

                  return [
                    Positioned.fill(
                      child: IgnorePointer(
                        child: CustomPaint(
                          painter: LinePainter(
                            start: begin,
                            end: end,
                            color: Theme.of(context)
                                .colorScheme
                                .onTertiaryContainer,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: _relative(begin.x) * widget.size,
                      top: _relative(begin.y) * widget.size,
                      child: _Handle(
                        value: begin,
                        size: Size.square(widget.size),
                        onMove: (value) {
                          widget.value.update(
                            LinearGradient(
                              colors: gradient.colors,
                              begin: value,
                              end: gradient.end,
                              stops: gradient.stops,
                              tileMode: gradient.tileMode,
                              transform: gradient.transform,
                            ),
                          );
                        },
                      ),
                    ),
                    Positioned(
                      left: _relative(end.x) * widget.size,
                      top: _relative(end.y) * widget.size,
                      child: _Handle(
                        value: end,
                        size: Size.square(widget.size),
                        onMove: (value) {
                          widget.value.update(
                            LinearGradient(
                              colors: gradient.colors,
                              begin: gradient.begin,
                              end: value,
                              stops: gradient.stops,
                              tileMode: gradient.tileMode,
                              transform: gradient.transform,
                            ),
                          );
                        },
                      ),
                    ),
                  ];
                }(),
              _ => [],
            }
          ],
        ),
        switch (widget.value.value) {
          LinearGradient gradient => Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: GestureDetector(
                onTapDown: (details) => _tapDownDetails = details,
                onTap: () {
                  final tapDownDetails = _tapDownDetails;
                  if (tapDownDetails == null) return;

                  final stop = tapDownDetails.localPosition.dx / widget.size;
                  final stops = gradient.stops ??
                      List.generate(
                        gradient.colors.length,
                        (index) => index / (gradient.colors.length - 1),
                      );

                  final List<Color> newColors;
                  final List<double> newStops;

                  if (stop < stops.first) {
                    final newColor = gradient.colors.first;
                    newColors = [newColor, ...gradient.colors];
                    newStops = [stop, ...stops];
                  } else if (stop > stops.last) {
                    final newColor = gradient.colors.last;
                    newColors = [...gradient.colors, newColor];
                    newStops = [...stops, stop];
                  } else {
                    final index = stops.indexWhere((element) => element > stop);
                    final left = gradient.colors[index - 1];
                    final right = gradient.colors[index];
                    final newColor = Color.lerp(
                      left,
                      right,
                      (stop - stops[index - 1]) /
                          (stops[index] - stops[index - 1]),
                    )!;

                    newColors = [...gradient.colors]..insert(index, newColor);
                    newStops = [...stops]..insert(index, stop);
                  }

                  widget.value.update(
                    LinearGradient(
                      colors: newColors,
                      stops: newStops,
                      begin: gradient.begin,
                      end: gradient.end,
                      tileMode: gradient.tileMode,
                      transform: gradient.transform,
                    ),
                  );
                },
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: LinearGradient(
                      colors: gradient.colors,
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      stops: gradient.stops,
                      tileMode: gradient.tileMode,
                      transform: gradient.transform,
                    ),
                  ),
                  child: SizedBox(
                    width: widget.size,
                    height: ColorBoxPicker.getSizeFor(32),
                    child: Stack(
                      children: [
                        for (final (index, color) in gradient.colors.indexed)
                          Builder(
                            builder: (context) {
                              final stop = gradient.stops?[index] ??
                                  (index / (gradient.colors.length - 1));

                              return Positioned(
                                left: stop * (widget.size) -
                                    ColorBoxPicker.getSizeFor(24) / 2,
                                top: 0,
                                height: ColorBoxPicker.getSizeFor(32),
                                child: Center(
                                  child: ColorBoxPicker(
                                    color: color,
                                    size: 24,
                                    onChanged: (value) {
                                      widget.value.update(
                                        LinearGradient(
                                          colors: [...gradient.colors]
                                            ..[index] = value,
                                          begin: gradient.begin,
                                          end: gradient.end,
                                          stops: gradient.stops,
                                          tileMode: gradient.tileMode,
                                          transform: gradient.transform,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          _ => const SizedBox(),
        }
      ],
    );
  }
}

class LinePainter extends CustomPainter {
  final Alignment start;
  final Alignment end;
  final Color color;

  const LinePainter({
    super.repaint,
    required this.start,
    required this.end,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 4;

    canvas.drawLine(
      Offset(_relative(start.x) * size.width, _relative(start.y) * size.height),
      Offset(_relative(end.x) * size.width, _relative(end.y) * size.height),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant LinePainter oldDelegate) {
    return start != oldDelegate.start ||
        end != oldDelegate.end ||
        color != oldDelegate.color;
  }
}

class _Handle extends StatefulWidget {
  final Alignment value;
  final Size size;

  final void Function(Alignment value) onMove;

  const _Handle({
    required this.value,
    required this.size,
    required this.onMove,
  });

  @override
  State<_Handle> createState() => __HandleState();
}

class __HandleState extends State<_Handle> {
  final LayerLink link = LayerLink();
  final controller = OverlayPortalController()..show();

  Alignment? startAlignment;
  Offset? startOffset;

  @override
  Widget build(BuildContext context) {
    return SkipFrame(
      child: OverlayPortal.targetsRootOverlay(
        controller: controller,
        overlayChildBuilder: (context) => CompositedTransformFollower(
          link: link,
          followerAnchor: Alignment.center,
          targetAnchor: Alignment.center,
          child: Center(
            child: GestureDetector(
              onPanStart: (details) {
                startAlignment = widget.value;
                startOffset = details.globalPosition;
              },
              onPanUpdate: (details) {
                final delta = details.globalPosition - startOffset!;

                final relativeDelta = Offset(
                  delta.dx / (widget.size.width / 2),
                  delta.dy / (widget.size.height / 2),
                );

                final nextAlignment = Alignment(
                  (startAlignment!.x + relativeDelta.dx),
                  (startAlignment!.y + relativeDelta.dy),
                );

                widget.onMove(nextAlignment);
              },
              child: Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onTertiaryContainer,
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ),
        child: CompositedTransformTarget(
          link: link,
          child: SizedBox(),
        ),
      ),
    );
  }
}
