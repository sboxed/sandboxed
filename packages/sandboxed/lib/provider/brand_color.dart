import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'brand_color.g.dart';

@riverpod
Color brandColor(Ref ref) {
  return Colors.green;
}
