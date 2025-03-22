import 'package:flutter/material.dart';
import 'package:sandboxed/widgets/gap.dart';
import 'package:sandboxed_sandbox/widgets/button.dart';

class AutomaticGeneration extends StatelessWidget {
  final String text;
  final Color color;
  final bool hasIcon;
  final VoidCallback? unsupported;
  final Gradient? gradient;
  final DateTime? datetime;
  final Duration? duration;

  const AutomaticGeneration({
    super.key,
    required this.text,
    this.hasIcon = true,
    this.color = Colors.yellow,
    this.unsupported,
    this.gradient,
    this.datetime,
    this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IntrinsicWidth(
          child: SandboxButton(
            title: text,
            color: color,
            onPressed: unsupported,
            icon: hasIcon ? const Icon(Icons.ac_unit) : null,
          ),
        ),
        const Gap(12),
        Text("Date: ${datetime?.toIso8601String()}"),
        const Gap(12),
        Text("Duration: ${duration?.toString()}"),
        const Gap(12),
        Container(
          width: 256,
          height: 64,
          decoration: BoxDecoration(
            gradient: gradient ??
                const LinearGradient(
                  colors: [
                    Colors.orange,
                    Colors.green,
                  ],
                ),
          ),
        ),
      ],
    );
  }
}
