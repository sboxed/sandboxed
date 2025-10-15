import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sandboxed/addons/mixins/decorator_addon.dart';
import 'package:sandboxed/addons/addon.dart';
import 'package:sandboxed/toolbar/toolbar_addon_mixin.dart';
import 'package:sandboxed/toolbar/toolbar_button.dart';
import 'package:sandboxed_core/decorator.dart';
import 'package:super_clipboard/super_clipboard.dart';

final class ScreenshotAddon extends Addon
    with DecoratorAddon, ToolbarAddonMixin {
  @override
  String get id => 'screenshot';

  @override
  get initialValue => null;

  final GlobalKey _repaintBoundaryKey = GlobalKey();
  final ValueNotifier<bool> _screenshotting = ValueNotifier(false);

  @override
  List<Decorator> decorate(BuildContext context) {
    return [
      Decorator(
        (context, story) {
          return ListenableBuilder(
            listenable: _screenshotting,
            builder: (context, child) {
              if (_screenshotting.value) {
                return OverflowBox(
                  alignment: Alignment.topLeft,
                  maxHeight: double.infinity,
                  child: RepaintBoundary(
                    key: _repaintBoundaryKey,
                    child: ColoredBox(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      child: child,
                    ),
                  ),
                );
              }

              return child!;
            },
            child: story,
          );
        },
      ),
    ];
  }

  Future<void> screenshot() async {
    _screenshotting.value = true;
    await waitFrames(2);

    try {
      final context = _repaintBoundaryKey.currentContext;
      if (context == null) return;
      if (!context.mounted) return;

      final pixelRatio = MediaQuery.devicePixelRatioOf(context);
      final renderObject = _repaintBoundaryKey.currentContext
          ?.findRenderObject() as RenderRepaintBoundary?;

      if (renderObject == null) return;

      final image = await renderObject.toImage(pixelRatio: pixelRatio);
      _screenshotting.value = false;

      final bytes = await image.toByteData(format: ImageByteFormat.png);
      if (bytes == null) return;

      final item = DataWriterItem();
      item.add(Formats.png(bytes.buffer.asUint8List()));
      await SystemClipboard.instance?.write([item]);
    } finally {
      _screenshotting.value = false;
    }
  }

  @override
  List<Widget> get actions {
    return [
      ListenableBuilder(
        listenable: this,
        builder: (context, child) {
          return ToolbarButton(
            onPressed: () => screenshot(),
            tooltip: ToolbarTooltip(message: 'Take screenshot'),
            child: Icon(Icons.screenshot),
          );
        },
      ),
    ];
  }
}

Future<void> waitFrame() {
  final completer = Completer();
  WidgetsBinding.instance.addPostFrameCallback((_) => completer.complete());
  return completer.future;
}

Future<void> waitFrames(int count) async {
  for (var i = 0; i < count; i++) {
    await waitFrame();
  }
}
