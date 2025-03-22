import 'package:collection/collection.dart';
import 'package:device_frame_plus/device_frame_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:slugify/slugify.dart';
import 'package:sandboxed/addons/addon.dart';
import 'package:sandboxed/addons/interactive_viewer/interactive_viewer_addon.dart';
import 'package:sandboxed/addons/mixins/decorator_addon.dart';
import 'package:sandboxed/provider/addons.dart';
import 'package:sandboxed/toolbar/toolbar_addon_mixin.dart';
import 'package:sandboxed/widgets/gap.dart';
import 'package:sandboxed_core/sandboxed_core.dart';

export 'package:device_frame_plus/device_frame_plus.dart';

class ViewportState with EquatableMixin {
  ViewportState({
    required this.devices,
    this.orientation = Orientation.portrait,
    this.hasFrame = true,
  });

  final List<DeviceInfo> devices;
  final Orientation orientation;
  final bool hasFrame;

  ViewportState copyWith({
    List<DeviceInfo>? devices,
    Orientation? orientation,
    bool? hasFrame,
  }) {
    return ViewportState(
      devices: devices ?? this.devices,
      orientation: orientation ?? this.orientation,
      hasFrame: hasFrame ?? this.hasFrame,
    );
  }

  @override
  List<Object?> get props => [devices, orientation, hasFrame];
}

/// A [DecoratorAddon] for changing the active device/frame. It's based on
/// the [`device_frame`](https://pub.dev/packages/device_frame) package.
final class ViewportAddon extends Addon
    with DecoratorAddon<ViewportState>, ToolbarAddonMixin {
  @override
  String get id => 'viewport';

  @override
  ViewportState get initialValue => ViewportState(devices: initialDevices);

  ViewportAddon({
    required this.devices,
    this.initialDevices = const [],
  }) : assert(
          devices.isNotEmpty,
          'devices cannot be empty',
        );

  final List<DeviceInfo> initialDevices;
  final List<DeviceInfo> devices;

  @override
  Widget? buildEditor(BuildContext context) {
    return ListenableBuilder(
      listenable: this,
      builder: (context, child) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Viewport'),
          const Gap(16),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            color: Theme.of(context).colorScheme.surfaceContainerHigh,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Devices'),
                  const Gap(16),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      for (final device in devices)
                        Consumer(
                          builder: (context, ref, child) => ChoiceChip(
                            label: Text(device.name),
                            selected: value.devices.contains(device),
                            onSelected: (value) {
                              this.value = this.value.copyWith(
                                    devices: value
                                        ? [...this.value.devices, device]
                                        : ([...this.value.devices]
                                          ..remove(device)),
                                  );

                              if (this.value.devices.length >= 2) {
                                ref
                                    .read(addonsProvider)
                                    .whereType<InteractiveViewerAddon>()
                                    .firstOrNull
                                    ?.value = true;
                              }
                            },
                          ),
                        ),
                    ],
                  ),
                  const Gap(24),
                  const Text('Orientation'),
                  const Gap(16),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      for (final orientation in Orientation.values)
                        ChoiceChip(
                          label: Text(orientation.name),
                          selected: value.orientation == orientation,
                          onSelected: (value) {
                            if (value) {
                              this.value =
                                  this.value.copyWith(orientation: orientation);
                            }
                          },
                        ),
                    ],
                  ),
                  const Gap(24),
                  const Text('Show Frame'),
                  const Gap(16),
                  Switch(
                    value: value.hasFrame,
                    onChanged: (value) =>
                        this.value = this.value.copyWith(hasFrame: value),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  List<Decorator> decorate(BuildContext context) {
    return [
      Decorator(
        (context, story) {
          return ListenableBuilder(
            listenable: this,
            builder: (context, child) {
              if (value.devices.isEmpty) {
                return child!;
              }

              final setting = value;
              final pickedDevices = value.devices.sortedBy<num>(
                (element) =>
                    element.screenSize.width + //
                    element.screenSize.height,
              );

              if (pickedDevices.length == 1) {
                return DeviceFrame(
                  device: pickedDevices.single,
                  orientation: setting.orientation,
                  isFrameVisible: setting.hasFrame,
                  screen: !setting.hasFrame //
                      ? SafeArea(child: child!)
                      : child!,
                );
              }

              return Column(
                children: [
                  for (final row in pickedDevices.slices(4))
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (final device in row)
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  device.name,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                ),
                                const Gap(12),
                                SizedBox.fromSize(
                                  size: switch (value.orientation) {
                                    Orientation.portrait => device.frameSize,
                                    _ => device.frameSize.flipped,
                                  },
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      border: !setting.hasFrame
                                          ? Border.all(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .inverseSurface,
                                            )
                                          : null,
                                    ),
                                    child: DeviceFrame(
                                      device: device,
                                      orientation: setting.orientation,
                                      isFrameVisible: setting.hasFrame,
                                      screen: child!,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                      ],
                    )
                ],
              );
            },
            child: story,
          );
        },
      ),
    ];
  }

  @override
  List<Widget> get actions {
    // const icons = {
    //   'devices': Icons.devices_other,
    //   'orientation': Icons.screen_rotation_outlined,
    //   'frame': Icons.border_style,
    // };

    return [
      // const VerticalDivider(),
      // for (final field in fields)
      //   ToolbarOverlayButton(
      //     overlay: (context) => Builder(
      //       builder: (context) {
      //         return field.toWidget(
      //           context,
      //           groupName,
      //           field.valueFrom(
      //               WidgetbookState.of(context).getAddonQueryParams(this)),
      //         );
      //       },
      //     ),
      //     tooltip: ToolbarTooltip(message: field.name.sentenceCase),
      //     child: Icon(icons[field.name] ?? Icons.devices),
      //   ),
      // const VerticalDivider(),
    ];
  }

  @override
  Map<String, dynamic> encode() {
    return {
      "devices": value.devices.map((e) => slugify(e.name)).toList(),
      "frame": value.hasFrame,
      "orientation": value.orientation.name,
    };
  }

  @override
  void decode(state) {
    final devices = (state['devices'] as List?)?.cast<String>();
    final frame = state['frame'] as bool?;
    final orientation = state['orientation'] as String?;

    value = value.copyWith(
      devices: devices != null
          ? this
              .devices
              .where((element) => devices.contains(slugify(element.name)))
              .toList()
          : null,
      hasFrame: frame,
      orientation: orientation != null //
          ? Orientation.values.byName(orientation)
          : null,
    );

    super.decode(state);
  }
}
