import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Color brandColor(Ref ref) {
  return Colors.green;
}

final brandColorProvider = Provider.autoDispose<Color>(brandColor);
