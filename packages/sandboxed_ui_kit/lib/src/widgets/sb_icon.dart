import 'package:flutter/material.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';

export 'package:iconify_flutter_plus/iconify_flutter_plus.dart';

class SBIcon extends StatelessWidget {
  final String icon;
  final Color? color;
  final double? size;

  const SBIcon(
    this.icon, {
    super.key,
    this.color,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Iconify(
      icon,
      color: color ?? IconTheme.of(context).color,
      size: size ?? IconTheme.of(context).size,
    );
  }
}
