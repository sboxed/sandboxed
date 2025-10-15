// dart format width=300

// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:sandboxed/widgets/gap.dart';
import 'package:sandboxed_core/sandboxed_core.dart';

Meta get meta => Meta<Widget>(name: "Material / Colors");

Story get $Default => Story(
  builder: (context, params) {
    return SingleChildScrollView(
      child: ColoredBox(
        color: Colors.black,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Base Colors"),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (final column in _base(context))
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        for (final item in column) ...[
                          Container(
                            width: 200,
                            height: 100,
                            color: item.background,
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Text(
                                item.name,
                                maxLines: 2,
                                style: TextStyle(color: item.foreground),
                              ),
                            ),
                          ),
                          Container(
                            width: 200,
                            height: 100,
                            color: item.foreground,
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Text(
                                item.onName,
                                maxLines: 2,
                                style: TextStyle(color: item.background),
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                ],
              ),
              Gap(32),
              Text("Surface Colors"),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (final column in _surface(context))
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        for (final item in column) ...[
                          Container(
                            width: 200,
                            height: 100,
                            color: item.background,
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Text(
                                item.name,
                                maxLines: 2,
                                style: TextStyle(color: item.foreground),
                              ),
                            ),
                          ),
                          Container(
                            width: 200,
                            height: 100,
                            color: item.foreground,
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Text(
                                item.onName,
                                maxLines: 2,
                                style: TextStyle(color: item.background),
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  },
);

// ---------------------------------------------

class _Data {
  final String name;
  final String onName;
  final Color background;
  final Color foreground;

  const _Data({
    required this.name,
    required this.onName,
    required this.background,
    required this.foreground,
  });
}

List<List<_Data>> _base(BuildContext context) {
  final scheme = Theme.of(context).colorScheme;
  return [
    [
      _Data(name: 'Primary', onName: 'On Primary', background: scheme.primary, foreground: scheme.onPrimary),
      _Data(name: 'Primary Container', onName: 'On Primary Container', background: scheme.primaryContainer, foreground: scheme.onPrimaryContainer),
      _Data(name: 'Primary Fixed', onName: 'On Primary Fixed', background: scheme.primaryFixed, foreground: scheme.onPrimaryFixed),
      _Data(name: 'Primary Fixed (Variant)', onName: 'On Primary Fixed (Variant)', background: scheme.primaryFixed, foreground: scheme.onPrimaryFixedVariant),
      _Data(name: 'Primary Fixed Dim', onName: 'On Primary Fixed Dim', background: scheme.primaryFixedDim, foreground: scheme.onPrimaryFixed),
      _Data(name: 'Primary Fixed Dim (Variant)', onName: 'On Primary Fixed Dim (Variant)', background: scheme.primaryFixedDim, foreground: scheme.onPrimaryFixedVariant),
    ],

    [
      _Data(name: 'Secondary', onName: 'On Secondary', background: scheme.secondary, foreground: scheme.onSecondary),
      _Data(name: 'Secondary Container', onName: 'On Secondary Container', background: scheme.secondaryContainer, foreground: scheme.onSecondaryContainer),
      _Data(name: 'Secondary Fixed', onName: 'On Secondary Fixed', background: scheme.secondaryFixed, foreground: scheme.onSecondaryFixed),
      _Data(name: 'Secondary Fixed (Variant)', onName: 'On Secondary Fixed (Variant)', background: scheme.secondaryFixed, foreground: scheme.onSecondaryFixedVariant),
      _Data(name: 'Secondary Fixed Dim', onName: 'On Secondary Fixed Dim', background: scheme.secondaryFixedDim, foreground: scheme.onSecondaryFixed),
      _Data(name: 'Secondary Fixed Dim (Variant)', onName: 'On Secondary Fixed Dim (Variant)', background: scheme.secondaryFixedDim, foreground: scheme.onSecondaryFixedVariant),
    ],

    [
      _Data(name: 'Tertiary', onName: 'On Tertiary', background: scheme.tertiary, foreground: scheme.onTertiary),
      _Data(name: 'Tertiary Container', onName: 'On Tertiary Container', background: scheme.tertiaryContainer, foreground: scheme.onTertiaryContainer),
      _Data(name: 'Tertiary Fixed', onName: 'On Tertiary Fixed', background: scheme.tertiaryFixed, foreground: scheme.onTertiaryFixed),
      _Data(name: 'Tertiary Fixed (Variant)', onName: 'On Tertiary Fixed (Variant)', background: scheme.tertiaryFixed, foreground: scheme.onTertiaryFixedVariant),
      _Data(name: 'Tertiary Fixed Dim', onName: 'On Tertiary Fixed Dim', background: scheme.tertiaryFixedDim, foreground: scheme.onTertiaryFixed),
      _Data(name: 'Tertiary Fixed Dim (Variant)', onName: 'On Tertiary Fixed Dim (Variant)', background: scheme.tertiaryFixedDim, foreground: scheme.onTertiaryFixedVariant),
    ],

    [
      _Data(name: 'Error', onName: 'On Error', background: scheme.error, foreground: scheme.onError),
      _Data(name: 'Error Container', onName: 'On Error Container', background: scheme.errorContainer, foreground: scheme.onErrorContainer),
    ],
  ];
}

List<List<_Data>> _surface(BuildContext context) {
  final scheme = Theme.of(context).colorScheme;
  return [
    [
      _Data(name: "Surface", onName: "On Surface", background: scheme.surface, foreground: scheme.onSurface),
    ],
    [
      _Data(name: "Surface Container Loweest", onName: "On Surface Container Loweest", background: scheme.surfaceContainerLowest, foreground: scheme.onSurface),
      _Data(name: "Surface Container Low", onName: "On Surface Container Low", background: scheme.surfaceContainerLow, foreground: scheme.onSurface),
      _Data(name: "Surface Container", onName: "On Surface Container", background: scheme.surfaceContainer, foreground: scheme.onSurface),
      _Data(name: "Surface Container High", onName: "On Surface Container High", background: scheme.surfaceContainerHigh, foreground: scheme.onSurface),
      _Data(name: "Surface Container Highest", onName: "On Surface Container Highest", background: scheme.surfaceContainerHighest, foreground: scheme.onSurface),
    ],
    [
      _Data(name: "Surface Dim", onName: "On Surface Dim", background: scheme.surfaceDim, foreground: scheme.onSurface),
      _Data(name: "Surface Tint", onName: "On Surface Tint", background: scheme.surfaceTint, foreground: scheme.onSurface),
      _Data(name: "Surface Bright", onName: "On Surface Bright", background: scheme.surfaceBright, foreground: scheme.onSurface),
      _Data(name: "Surface Variant", onName: "On Surface Variant", background: scheme.surfaceVariant, foreground: scheme.onSurfaceVariant),
    ],
  ];
}
