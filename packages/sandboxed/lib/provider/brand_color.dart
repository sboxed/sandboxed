import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Color brandColor(Ref ref) {
  return Colors.green;
}

final brandColorProvider = Provider.autoDispose<Color>(brandColor);
