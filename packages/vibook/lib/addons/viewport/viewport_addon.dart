import 'package:collection/collection.dart';
import 'package:device_frame_plus/device_frame_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:vibook/addons/addon.dart';
import 'package:vibook/addons/decorator_addon.dart';
import 'package:vibook/toolbar/toolbar_addon_mixin.dart';
import 'package:vibook/widgets/gap.dart';
import 'package:vibook_core/vibook_core.dart';

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
  late final notifier = ValueNotifier(ViewportState(devices: initialDevices));

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
      listenable: notifier,
      builder: (context, child) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Viewport'),
          const Gap(16),
          Card(
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
                        ChoiceChip(
                          label: Text(device.name),
                          selected: notifier.value.devices.contains(device),
                          onSelected: (value) =>
                              notifier.value = notifier.value.copyWith(
                            devices: value
                                ? [...notifier.value.devices, device]
                                : ([...notifier.value.devices]..remove(device)),
                          ),
                        ),
                    ],
                  ),
                  const Gap(24),
                  Text('Orientation'),
                  const Gap(16),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      for (final orientation in Orientation.values)
                        ChoiceChip(
                          label: Text(orientation.name),
                          selected: notifier.value.orientation == orientation,
                        ),
                    ],
                  ),
                  const Gap(24),
                  Text('Show Frame'),
                  const Gap(16),
                  Switch(
                    value: notifier.value.hasFrame,
                    onChanged: (value) => notifier.value =
                        notifier.value.copyWith(hasFrame: value),
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
            listenable: notifier,
            builder: (context, child) {
              if (notifier.value.devices.isEmpty) {
                return child!;
              }

              final setting = notifier.value;
              final pickedDevices = notifier.value.devices;

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
                  for (final row in pickedDevices.slices(5))
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (final device in row)
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: SizedBox.fromSize(
                              size: device.screenSize,
                              child: DeviceFrame(
                                device: device,
                                orientation: setting.orientation,
                                isFrameVisible: setting.hasFrame,
                                screen: child!,
                              ),
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
}
